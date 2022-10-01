import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorat2022/main.dart';

import 'tab_tile.dart';

class WebSidePanel extends StatefulWidget {
  const WebSidePanel(
      {Key? key,
      required this.tabData,
      required this.isSelected,
      required this.aspectRatio,
      required this.tabs})
      : super(key: key);

  final List<List<Object>> tabData;
  final List<bool> isSelected;
  final double aspectRatio;
  final List<Widget> tabs;

  @override
  State<WebSidePanel> createState() => _WebSidePanelState();
}

class _WebSidePanelState extends State<WebSidePanel> {
  Widget? _buildBody() {
    for (bool selected in widget.isSelected) {
      if (selected) {
        return widget.tabs[widget.isSelected.indexOf(selected)];
      }
    }

    return Container(
        color: Colors.white, child: const Center(child: Text("Error 404")));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 119,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.tabData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < widget.isSelected.length; i++) {
                          if (i != index) {
                            widget.isSelected[i] = false;
                          }
                        }
                        setState(() {
                          widget.isSelected[index] = true;
                        });
                      },
                      child: TabTile(
                        text: widget.tabData[index][1] as String,
                        icon: widget.tabData[index][0] as IconData,
                        isSelected: widget.isSelected[index],
                        isSmall: widget.aspectRatio < 0.6,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              IconButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                    navigatorKey.currentState!
                        .popUntil((route) => route.isFirst);
                  },
                  icon: const Icon(Icons.logout)),
            ],
          ),
        ),
        const VerticalDivider(
          color: Colors.black,
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildBody(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 22, 41, 76),
          height: size.height,
          width: size.width,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          child: Row(
            children: [
              AnimatedContainer(
                width: widget.aspectRatio < 0.6 ? 160 : 53,
                height: size.height - 20 * 2,
                duration: const Duration(milliseconds: 350),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.tabData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              for (int i = 0;
                                  i < widget.isSelected.length;
                                  i++) {
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
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: _buildBody(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

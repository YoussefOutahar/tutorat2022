import 'package:flutter/material.dart';

import 'tab_tile.dart';

class WebSidePanel extends StatefulWidget {
  const WebSidePanel(
      {Key? key,
      required this.tabData,
      required this.isSelected,
      required this.aspectRatio,
      required this.body})
      : super(key: key);

  final List<List<Object>> tabData;
  final List<bool> isSelected;
  final double aspectRatio;
  final Widget body;

  @override
  State<WebSidePanel> createState() => _WebSidePanelState();
}

class _WebSidePanelState extends State<WebSidePanel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 22, 41, 76),
          height: size.height,
          width: size.width,
          child: Container(),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          child: Row(
            children: [
              AnimatedContainer(
                width: widget.aspectRatio < 0.7 ? 160 : 53,
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
                                widget.isSelected[index] =
                                    !widget.isSelected[index];
                              });
                            },
                            child: TabTile(
                              text: widget.tabData[index][1] as String,
                              icon: widget.tabData[index][0] as IconData,
                              isSelected: widget.isSelected[index],
                              isSmall: widget.aspectRatio < 0.7,
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
                  child: widget.body,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

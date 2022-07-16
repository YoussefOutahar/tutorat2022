import 'package:flutter/material.dart';
import 'package:tutorat2022/Pages/MainPage/tab_tile.dart';

class AdaptiveSidePanel extends StatefulWidget {
  const AdaptiveSidePanel({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<AdaptiveSidePanel> createState() => _AdaptiveSidePanelState();
}

class _AdaptiveSidePanelState extends State<AdaptiveSidePanel> {
  List<bool> _isSelected = [false, false, false, false];
  List<List<Object>> tabData = [
    [Icons.home, "Home"],
    [Icons.history, "History"],
    [Icons.home, "Home"],
    [Icons.history, "History"]
  ];

  void falsifyAll(int index) {
    for (int i = 0; i < _isSelected.length; i++) {
      if (i != index) {
        _isSelected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
        tag: "MainPage",
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isPortrait = constraints.maxWidth < constraints.maxHeight;
            double aspectRatio = isPortrait
                ? constraints.maxWidth / constraints.maxHeight
                : constraints.maxHeight / constraints.maxWidth;
            if (isPortrait) {
              return Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    height: size.height, //60,
                    width: size
                        .width, //size.width - 20 * 2, // Minus The Padding in both sides
                  ),
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        height: 60,
                        width: size.width -
                            20 * 2, // Minus The Padding in both sides
                        child:
                            Container(), //TODO: Add the side buttons to the side panel.
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: widget.body,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
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
                          width: aspectRatio < 0.7 ? 200 : 53,
                          height: size.height - 20 * 2,
                          duration: const Duration(milliseconds: 350),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 120,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: tabData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        falsifyAll(index);
                                        setState(() {
                                          _isSelected[index] =
                                              !_isSelected[index];
                                        });
                                      },
                                      child: TabTile(
                                        text: tabData[index][1] as String,
                                        icon: tabData[index][0] as IconData,
                                        isSelected: _isSelected[index],
                                        isSmall: aspectRatio < 0.7,
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
          },
        ),
      ),
    );
  }
}

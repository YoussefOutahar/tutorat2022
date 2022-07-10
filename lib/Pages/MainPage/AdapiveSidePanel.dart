import 'package:flutter/material.dart';

class AdaptiveSidePanel extends StatefulWidget {
  const AdaptiveSidePanel({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<AdaptiveSidePanel> createState() => _AdaptiveSidePanelState();
}

class _AdaptiveSidePanelState extends State<AdaptiveSidePanel> {
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
              return Column(
                children: [
                  AnimatedContainer(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    duration: const Duration(milliseconds: 200),
                    height: 60,
                    width:
                        size.width - 20 * 2, // Minus The Padding in both sides
                  ),
                  Expanded(child: widget.body),
                ],
              );
            } else {
              return Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: size.height - 20 * 2,
                    width: aspectRatio < 0.7 ? 200 : 60,
                    child: Container(),
                  ),
                  Expanded(child: widget.body),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

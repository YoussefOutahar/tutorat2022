// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PhoneSidePanel extends StatefulWidget {
  const PhoneSidePanel({
    Key? key,
    this.body,
  }) : super(key: key);

  final Widget? body;

  @override
  State<PhoneSidePanel> createState() => _PhoneSidePanelState();
}

class _PhoneSidePanelState extends State<PhoneSidePanel>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Stack(
          children: [
            Container(
              color: Colors.blue,
              height: size.height, //60,
              width: size.width,
            ),
            Column(
              children: [
                SizedBox(
                  height: 45,
                  width: size.width - 20 * 2, // Minus The Padding in both sides
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedIcon(
                            icon: AnimatedIcons.close_menu,
                            progress: _controller,
                          ),
                        )
                      ],
                    ),
                  ),
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
      },
    );
  }
}

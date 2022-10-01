import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tutorat2022/Auth/auth_page.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait = constraints.maxWidth < constraints.maxHeight;
        double aspectRatio = isPortrait
            ? constraints.maxWidth / constraints.maxHeight
            : constraints.maxHeight / constraints.maxWidth;
        return SizedBox(
          width: widget.width,
          height: widget.height,
          child: Hero(
            tag: "MainPage",
            child: Card(
              elevation: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //ACHRAF this was 40
              ),
              //surfaceTintColor: Colors.blue.shade400,
              color: const Color.fromARGB(
                  255, 22, 41, 76), //ACHRAF this was nothing
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      reverseDuration: const Duration(milliseconds: 1),
                      switchInCurve: Curves.fastLinearToSlowEaseIn,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) =>
                              ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: const AuthPage(),
                    ),
                  ),
                  if (aspectRatio < 0.6)
                    VerticalDivider(
                      indent: widget.height / 6,
                      endIndent: widget.height / 6,
                    ),
                  if (aspectRatio < 0.6)
                    Lottie.asset(
                      "assets/animations/online-learning.json",
                      frameRate: FrameRate(60), //ACHRAF added this
                      repeat: true,
                      height: widget.height / 2,
                      width: widget.width / 2,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

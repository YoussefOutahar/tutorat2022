import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/auth_text_field.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

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
  bool _isRegistring = false;
  Function login = (String email, String password, BuildContext context) {
    bool _validAccount = true;
    if (_validAccount) {
      Navigator.pushNamed(context, '/Tutorat');
    } else {
      //TODO: error message
    }
    return true;
  };
  Function register = () {
    //TODO: Implement Register
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Card(
        elevation: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), //ACHRAF this was 40
        ),
        surfaceTintColor: Colors.blue.shade400,
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
                child: _isRegistring
                    ? RegisterForm(
                        width: widget.width,
                        height: widget.height,
                        swap: () =>
                            setState(() => _isRegistring = !_isRegistring),
                      )
                    : LoginForm(
                        width: widget.width,
                        height: widget.height,
                        swap: () =>
                            setState(() => _isRegistring = !_isRegistring),
                      ),
              ),
            ),
            VerticalDivider(
              indent: widget.height / 6,
              endIndent: widget.height / 6,
            ),
            Lottie.asset(
              "assets/online-learning.json",
              frameRate: FrameRate(60), //ACHRAF added this
              repeat: true,
              height: widget.height / 2,
              width: widget.width / 2,
            ),
          ],
        ),
      ),
    );
  }
}

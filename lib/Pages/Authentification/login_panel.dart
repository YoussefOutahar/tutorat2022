import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'auth_text_field.dart';

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
  Function login = () {
    //TODO: Implement Login
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
          borderRadius: BorderRadius.circular(40),
        ),
        surfaceTintColor: Colors.blue.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
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

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key, required this.width, required this.height, required this.swap})
      : super(key: key);
  final double width;
  final double height;
  final VoidCallback swap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Image(
            width: width / 6,
            height: height / 6,
            image: const AssetImage('assets/Logo-UIR.png'),
          ),
        ),
        const SizedBox(height: 80),
        AuthTextField(
          width: width / 3,
          height: height / 11,
          icon: Icons.person,
          iconColor: Colors.blue,
          labelText: 'Login',
          passwordText: false,
          borderColor: Colors.blue,
        ),
        const SizedBox(height: 20),
        AuthTextField(
          width: width / 3,
          height: height / 11,
          icon: Icons.lock,
          iconColor: Colors.blue,
          labelText: 'Password',
          passwordText: true,
          borderColor: Colors.blue,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: width / 3,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: swap,
                child: const Text('Register'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm(
      {Key? key, required this.width, required this.height, required this.swap})
      : super(key: key);

  final double width;
  final double height;
  final VoidCallback swap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Image(
            width: width / 6,
            height: height / 6,
            image: const AssetImage('assets/Logo-UIR.png'),
          ),
        ),
        const SizedBox(height: 80),
        AuthTextField(
          width: width / 3,
          height: height / 11,
          icon: Icons.person,
          iconColor: Colors.blue,
          labelText: 'Login',
          passwordText: false,
          borderColor: Colors.blue,
        ),
        const SizedBox(height: 20),
        AuthTextField(
          width: width / 3,
          height: height / 11,
          icon: Icons.lock,
          iconColor: Colors.blue,
          labelText: 'Password',
          passwordText: true,
          borderColor: Colors.blue,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: width / 3,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Create Account'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: swap,
                child: const Text('Back'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tutorat2022/Auth/Authentification/widgets/login_form.dart';

import 'Authentification/widgets/sign_up_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginForm(
          onClickSignUp: toggle,
          width: 800,
          height: 500,
        )
      : SignUpForm(
          onClickSignUp: toggle,
          width: 800,
          height: 500,
        );

  void toggle() {
    setState(() => isLogin = !isLogin);
  }
}

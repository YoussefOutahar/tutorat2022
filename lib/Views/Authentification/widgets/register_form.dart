import 'package:flutter/material.dart';

import 'auth_text_field.dart';

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
          child: PhysicalModel(
            color: Colors.transparent,
            shadowColor: Colors.black,
            elevation: 20,
            child: Image(
                width: height / 6,
                height: height / 6,
                image: const AssetImage('assets/Logo-UIR.png'),
                fit: BoxFit.cover),
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

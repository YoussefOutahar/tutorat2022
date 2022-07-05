import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../CustomTextField.dart';

class LoginPanel extends StatelessWidget {
  const LoginPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 400,
      height: 400,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomTextField(
              borderradius: 20,
              bordercolor: Colors.white,
              widh: 350,
              height: 50,
              icon: Icons.person,
              iconColor: Colors.black,
              hinttext: 'test',
              hintColor: Colors.black,
              fontsize: 20,
              obscureText: false,
            ),
            SizedBox(height: 10),
            CustomTextField(
              borderradius: 20,
              bordercolor: Colors.white,
              widh: 350,
              height: 50,
              icon: Icons.person,
              iconColor: Colors.black,
              hinttext: 'test',
              hintColor: Colors.black,
              fontsize: 20,
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}

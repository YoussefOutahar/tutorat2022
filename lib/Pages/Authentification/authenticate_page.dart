import 'package:flutter/material.dart';

import 'login_panel.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({Key? key}) : super(key: key);

  @override
  State<AuthenticatePage> createState() => _MainPageState();
}

class _MainPageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isPortrait = constraints.maxWidth < constraints.maxHeight;
          return Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/large_UIR.jpg'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white
                        .withOpacity(0.4), //blue.shade900.withOpacity(0.6),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(80.0),
                  child: LoginPanel(
                    width: 800,
                    height: 500,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

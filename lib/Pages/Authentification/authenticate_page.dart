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
          return Container(
            width: size.width,
            height: size.height,
            color: Colors.red,
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(80.0),
                    child: LoginPanel(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

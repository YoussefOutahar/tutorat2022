import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key, this.routeName}) : super(key: key);

  final String? routeName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/404-not-found.json',
              height: size.width * 0.4,
              width: size.width * 0.4,
              repeat: true,
              frameRate: FrameRate(60),
            ),
          ],
        ),
      ),
    );
  }
}

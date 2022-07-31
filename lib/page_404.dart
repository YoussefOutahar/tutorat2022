import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key, required this.routeName}) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${routeName.substring(1)} page not Found'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tutorat2022/Pages/MainPage/AdapiveSidePanel.dart';

class TutoratPage extends StatefulWidget {
  const TutoratPage({Key? key}) : super(key: key);

  @override
  State<TutoratPage> createState() => _TutoratPageState();
}

class _TutoratPageState extends State<TutoratPage> {
  @override
  Widget build(BuildContext context) {
    return const AdaptiveSidePanel(
      body: Center(
        child: Text("data"),
      ),
    );
  }
}

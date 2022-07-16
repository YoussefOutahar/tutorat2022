import 'package:flutter/material.dart';
import 'package:tutorat2022/Pages/MainPage/adapive_side_panel.dart';

class TutoratPage extends StatefulWidget {
  const TutoratPage({Key? key}) : super(key: key);

  @override
  State<TutoratPage> createState() => _TutoratPageState();
}

class _TutoratPageState extends State<TutoratPage> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return AdaptiveSidePanel(
        body: AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ));
  }
}

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
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return AdaptiveSidePanel(
        body: Padding(
      padding: isPortrait
          ? const EdgeInsets.only(left: 20.0, bottom: 20.0, right: 20.0)
          : const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ));
  }
}

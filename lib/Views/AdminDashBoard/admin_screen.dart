import 'package:flutter/material.dart';
import 'package:tutorat2022/Views/AdaptiveSidePanel/adapive_side_panel.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveSidePanel(
      tabData: [
        [Icons.abc, "Home"],
        [Icons.abc, "Home"],
        [Icons.abc, "Home"],
        [Icons.abc, "Home"],
      ],
      tabs: [
        AnimatedContainer(
          key: const Key("1"),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        AnimatedContainer(
          key: const Key('2'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        AnimatedContainer(
          key: const Key('3'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        AnimatedContainer(
          key: const Key('4'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ],
    );
  }
}

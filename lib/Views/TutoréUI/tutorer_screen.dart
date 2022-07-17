import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../AdaptiveSidePanel/adapive_side_panel.dart';
import 'Pages/t_home_page.dart';

class TutoratPage extends StatefulWidget {
  const TutoratPage({Key? key}) : super(key: key);
  @override
  State<TutoratPage> createState() => _TutoratPageState();
}

class _TutoratPageState extends State<TutoratPage> {
  List<List<Object>> tabData = [
    [Iconsax.home, "Home"],
    [Icons.history, "History"],
    [Icons.history, "History"],
    [Icons.history, "History"],
  ];
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return AdaptiveSidePanel(
      tabData: tabData,
      tabs: [
        AnimatedContainer(
          key: const Key("1"),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const THomePage(),
        ),
        AnimatedContainer(
          key: const Key('2'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        AnimatedContainer(
          key: const Key('3'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        AnimatedContainer(
          key: const Key('4'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}

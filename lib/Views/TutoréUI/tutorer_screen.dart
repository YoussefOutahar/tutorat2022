import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/Pages/t_history_page.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/Pages/t_module_page.dart';

import '../AdaptiveSidePanel/adapive_side_panel.dart';
import 'Pages/t_calendar_page.dart';
import 'Pages/HomeDashBoard/t_home_page.dart';

class TutoratPage extends StatefulWidget {
  const TutoratPage({Key? key}) : super(key: key);
  @override
  State<TutoratPage> createState() => _TutoratPageState();
}

class _TutoratPageState extends State<TutoratPage> {
  List<List<Object>> tabData = [
    [Iconsax.home, "Home"],
    [Iconsax.folder, "Modules"],
    [Iconsax.calendar, "Calendar"],
    [Iconsax.receipt_discount, "History"],
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
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const THomePage(),
        ),
        AnimatedContainer(
          key: const Key('2'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const TModulePage(),
        ),
        AnimatedContainer(
          key: const Key('3'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const TCalendarPage(),
        ),
        AnimatedContainer(
          key: const Key('4'),
          duration: const Duration(milliseconds: 350),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const THistoryPage(),
        ),
      ],
    );
  }
}

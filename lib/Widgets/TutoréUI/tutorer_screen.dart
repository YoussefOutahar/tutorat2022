import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tutorat2022/Apps/Tutorer/Pages/HomeDashBoard/t_home_page.dart';
import 'package:tutorat2022/Apps/Tutorer/Pages/t_calendar_page.dart';
import 'package:tutorat2022/Apps/Tutorer/Pages/t_history_page.dart';
import 'package:tutorat2022/Widgets/Tutor%C3%A9UI/Pages/ModulePage/t_module_page.dart';

import '../AdaptiveSidePanel/adapive_side_panel.dart';

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
        Container(
          key: const Key("1"),
          child: const THomePage(),
        ),
        Container(
          key: const Key('2'),
          child: const TModulePage(),
        ),
        Container(
          key: const Key('3'),
          child: const TCalendarPage(),
        ),
        Container(
          key: const Key('4'),
          child: const THistoryPage(),
        ),
      ],
    );
  }
}

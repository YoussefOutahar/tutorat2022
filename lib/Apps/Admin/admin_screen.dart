import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tutorat2022/Widgets/AdaptiveSidePanel/adapive_side_panel.dart';

import 'Pages/StudentPage/students_page.dart';
import 'Pages/home_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveSidePanel(
      tabData: const [
        [Iconsax.activity, "DashBoard"],
        [Iconsax.personalcard, "Trrafic"],
        [Icons.abc, "Statistics"],
        [Icons.abc, "Applications"],
        [Icons.abc, "Administartion"],
      ],
      tabs: [
        Container(
          key: const Key("1"),
          child: const AdminHomePage(),
        ),
        Container(
          key: const Key('2'),
          child: const StudentsPage(),
        ),
        Container(
          key: const Key('3'),
        ),
        Container(
          key: const Key('4'),
        ),
        Container(
          key: const Key("5"),
          child: const AdminHomePage(),
        ),
      ],
    );
  }
}

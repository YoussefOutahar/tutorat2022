import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'module_card_mini.dart';

class MainModuleView extends StatefulWidget {
  const MainModuleView({Key? key}) : super(key: key);

  @override
  State<MainModuleView> createState() => _MainModuleViewState();
}

class _MainModuleViewState extends State<MainModuleView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ModuleCardMini(
          availableseats: 2,
          date: '',
          description: '',
          height: 180,
          onTap: () {},
          title: '',
          width: 500,
          tutor: '',
        );
      },
    );
  }
}


// Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: ModuleCardMini(
//             width: 80,
//             height: (index == 2) ? 250 : (index % 4 + 3) * 80,
//             availableseats: 20,
//             title: "Programmation Web Flutter",
//             tutor: "Monsieur Outahar",
//             date: "nhar 7witk",
//             description: "9ra la date",
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     title: const Text("Programmation Web Flutter"),
//                     content: const Text("Monsieur Outahar"),
//                     actions: [
//                       MaterialButton(
//                         child: const Text("Ok"),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       )
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         )

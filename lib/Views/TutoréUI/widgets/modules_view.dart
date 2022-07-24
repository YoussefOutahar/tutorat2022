import 'package:flutter/material.dart';
import 'package:tutorat2022/Views/TutoréUI/widgets/module_card.dart';

class ModulesView extends StatelessWidget {
  const ModulesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Modules: ',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "SF Pro",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
                child: Text(
                  'Mes modules: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "SF Pro",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ModuleCard(
              width: 300,
              height: 200,
              availableseats: 20,
              title: "Programmation Web Flutter",
              tutor: "Monsieur Outahar",
              date: "nhar 7witk",
              description: "9ra la date",
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Programmation Web Flutter"),
                        content: Text("Monsieur Outahar"),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              },
            ),
          );
        }
      },
    );
  }
}

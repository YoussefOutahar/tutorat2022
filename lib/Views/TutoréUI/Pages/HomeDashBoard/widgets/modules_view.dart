import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/widgets/Modules/module_card_mini.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/widgets/Modules/module_carousel.dart';

class ModulesView extends StatelessWidget {
  const ModulesView({Key? key, required this.myModules}) : super(key: key);

  final List<Widget> myModules;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
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
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width / 5,
                child: SearchBarAnimation(
                  isSearchBoxOnRightSide: true,
                  hintText: "Youssef Outahar",
                  durationInMilliSeconds: 500,
                  isOriginalAnimation: false,
                  buttonBorderColour: Colors.black45,
                  buttonIcon: Icons.search,
                  onFieldSubmitted: (String value) {
                    debugPrint('onFieldSubmitted value $value');
                  },
                  textEditingController: TextEditingController(),
                ),
              ),
            ),
          ],
        ),
        ModuleCarousel(myModules: myModules, size: size),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
          child: Text(
            'Suggestions: ',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "SF Pro",
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
            ),
          ),
        ),
        Expanded(
          child: MasonryGridView.count(
            controller: ScrollController(),
            crossAxisCount: 3,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ModuleCardMini(
                  width: 80,
                  height: (index == 2) ? 250 : (index % 4 + 3) * 80,
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
                          title: const Text("Programmation Web Flutter"),
                          content: const Text("Monsieur Outahar"),
                          actions: [
                            FlatButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

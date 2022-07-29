import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/Pages/HomeDashBoard/widgets/modules_view.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/Pages/ModulePage/widgets/main_modules_view.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/widgets/Modules/module_card.dart';

class TModulePage extends StatefulWidget {
  const TModulePage({Key? key}) : super(key: key);

  @override
  State<TModulePage> createState() => _TModulePageState();
}

class _TModulePageState extends State<TModulePage> {
  List<Widget> _buildCurrentModules() {
    List<Widget> modules = [];
    for (int i = 0; i < 3; i++) {
      modules.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ModuleCard(
          availableseats: 2,
          date: '',
          description: '',
          height: 180,
          onTap: () {},
          title: '',
          width: 500,
          tutor: '',
        ),
      ));
    }
    return modules;
  }

  Widget _buildSelectionTab(String title) {
    bool isHovered = false;
    return MouseRegion(
      onEnter: ((event) {
        setState(() {
          isHovered = true;
        });
      }),
      onExit: ((event) {
        setState(() {
          isHovered = false;
        });
      }),
      child: GestureDetector(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("$title >"),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Mes modules: ',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "SF Pro",
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildCurrentModules(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildSelectionTab("Current"),
              _buildSelectionTab("Suggested"),
              const Spacer(),
              SizedBox(
                width: size.width / 5,
                child: SearchBarAnimation(
                  isSearchBoxOnRightSide: true,
                  hintText: "Search ...",
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
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              const Flexible(
                flex: 2,
                child: MainModuleView(),
              ),
              Flexible(
                  child: Container(
                color: Colors.red,
              ))
            ],
          ),
        )
      ],
    );
  }
}

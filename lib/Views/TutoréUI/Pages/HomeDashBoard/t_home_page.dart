import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../widgets/Modules/module_card.dart';
import '../../widgets/Modules/module_carousel.dart';
import '../../widgets/Modules/module_view.dart';

class THomePage extends StatefulWidget {
  const THomePage({Key? key}) : super(key: key);

  @override
  State<THomePage> createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait = constraints.maxWidth < constraints.maxHeight;
        double aspectRatio = isPortrait
            ? constraints.maxWidth / constraints.maxHeight
            : constraints.maxHeight / constraints.maxWidth;
        if (aspectRatio < 0.6) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
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
                              padding: const EdgeInsets.only(
                                  left: 30, bottom: 10, top: 10),
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
                    ModuleCarousel(
                        myModules: _buildCurrentModules(), size: size),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, bottom: 10, top: 10),
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
                    const Expanded(child: MainModuleView())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SfCalendar(
                          view: CalendarView.schedule,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Card(
                          surfaceTintColor: Colors.grey,
                          elevation: 5,
                          child: ListView(
                            children: [
                              ListTile(
                                title: Text("Module 1"),
                                subtitle: Text("Module 1"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                title: Text("Module 1"),
                                subtitle: Text("Module 1"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                              ListTile(
                                title: Text("Module 1"),
                                subtitle: Text("Module 1"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(30.0),
            child: MainModuleView(),
          );
        }
      },
    );
  }
}

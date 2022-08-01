import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/Pages/HomeDashBoard/widgets/modules_view.dart';

import '../../widgets/Modules/module_card.dart';

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
                child: ModulesView(
                  myModules: _buildCurrentModules(),
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
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: ModulesView(
              myModules: _buildCurrentModules(),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:tutorat2022/Views/Tutor%C3%A9UI/widgets/modules_view.dart';

class THomePage extends StatefulWidget {
  const THomePage({Key? key}) : super(key: key);

  @override
  State<THomePage> createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {
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
              const Flexible(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: ModulesView(),
                    ),
                  )),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SfCalendar(),
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
            child: ModulesView(),
          );
        }
      },
    );
  }
}

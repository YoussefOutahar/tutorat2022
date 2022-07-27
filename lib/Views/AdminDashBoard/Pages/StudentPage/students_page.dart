import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  int _studentRowCount(double aspectRatio, bool isPortrait) {
    if (isPortrait) return 3;
    if (aspectRatio < 4 / 3) return 4;
    if (aspectRatio < 16 / 10 && aspectRatio > 4 / 3) return 5;
    if (aspectRatio < 16 / 9 && aspectRatio > 16 / 10) return 6;

    return 7;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        double aspectRatio = MediaQuery.of(context).size.aspectRatio;
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(label: Text('Student 1')),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(label: Text('Student 2')),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Chip(label: Text('Student 3')),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    controller: ScrollController(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _studentRowCount(aspectRatio, isPortrait),
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                    ),
                    itemBuilder: (context, idex) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Container();
                              });
                        },
                        child: const ProfilePicture(
                            name: "tessst", radius: 2, fontsize: 20),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

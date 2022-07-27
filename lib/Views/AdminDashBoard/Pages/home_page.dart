import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        double aspectRatio = MediaQuery.of(context).size.aspectRatio;
        if (isPortrait) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Dashboard"),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LineChart(LineChartData()),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Card(
                    child: SizedBox(
                      width: size.width / 2,
                      height: size.height / 2,
                      child: LineChart(LineChartData()),
                    ),
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Card(
                      color: Colors.red,
                    )),
              ],
            ),
          );
        }
      },
    );
  }
}

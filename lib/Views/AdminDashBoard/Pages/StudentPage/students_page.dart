import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
    Size? size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        double aspectRatio = MediaQuery.of(context).size.aspectRatio;
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width / 5,
                  child: SearchBarAnimation(
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
              Expanded(
                child: SfDataGrid(
                  source: StudentDataSource(studentData: getStudentData()),
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'id',
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'ID',
                            ))),
                    GridColumn(
                        columnName: 'name',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Name'))),
                    GridColumn(
                        columnName: 'designation',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Designation',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'salary',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Salary'))),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Student> getStudentData() {
  return [
    Student(10001, 'James', 'Project Lead', 20000),
    Student(10002, 'Kathryn', 'Manager', 30000),
    Student(10003, 'Lara', 'Developer', 15000),
    Student(10004, 'Michael', 'Designer', 15000),
    Student(10005, 'Martin', 'Developer', 15000),
    Student(10006, 'Newberry', 'Developer', 15000),
    Student(10007, 'Balnc', 'Developer', 15000),
    Student(10008, 'Perry', 'Developer', 15000),
    Student(10009, 'Gable', 'Developer', 15000),
    Student(10010, 'Grimes', 'Developer', 15000)
  ];
}

class Student {
  Student(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

class StudentDataSource extends DataGridSource {
  StudentDataSource({required List<Student> studentData}) {
    _studentData = studentData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _studentData = [];

  @override
  List<DataGridRow> get rows => _studentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

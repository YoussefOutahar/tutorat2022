import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/250?image=9',
            fit: BoxFit.cover,
          ),
          const Text('Student 1'),
          Row()
        ],
      ),
    );
  }
}

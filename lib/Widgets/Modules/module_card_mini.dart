import 'package:flutter/material.dart';

class ModuleCardMini extends StatefulWidget {
  const ModuleCardMini(
      {Key? key,
      required this.width,
      required this.height,
      required this.availableseats,
      required this.title,
      required this.tutor,
      required this.date,
      required this.description,
      required this.onTap})
      : super(key: key);

  final double width;
  final double height;
  final String title;
  final String tutor;
  final String date;
  final String description;
  final int availableseats;

  final VoidCallback onTap;

  @override
  State<ModuleCardMini> createState() => _ModuleCardMini();
}

class _ModuleCardMini extends State<ModuleCardMini> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: LayoutBuilder(builder: (context, constraints) {
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
            onTap: widget.onTap,
            child: Card(
              elevation: isHovered ? 12 : 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.school,
                    size: constraints.maxWidth * 0.6,
                    color: Colors.blue,
                  ),
                  Text(widget.title),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

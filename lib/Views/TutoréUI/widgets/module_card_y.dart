import 'package:flutter/material.dart';

class ModuleCardBOLS extends StatefulWidget {
  const ModuleCardBOLS(
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
  State<ModuleCardBOLS> createState() => _ModuleCardBOLS();
}

class _ModuleCardBOLS extends State<ModuleCardBOLS> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
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
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Card(
            elevation: isHovered ? 8 : 0,
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                ),
                Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: widget.height * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

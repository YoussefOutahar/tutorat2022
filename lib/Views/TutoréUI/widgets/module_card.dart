import 'package:flutter/material.dart';

class ModuleCard extends StatefulWidget {
  const ModuleCard(
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
  State<ModuleCard> createState() => _ModuleCard();
}

class _ModuleCard extends State<ModuleCard> {
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
          width: widget.width,
          height: widget.height,
          child: Card(
            elevation: isHovered ? 12 : 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: const Image(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/module_img.png'),
                    ),
                  ),
                ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Tuteur : ${widget.tutor}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'Date : ${widget.date}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Places restantes : ${widget.availableseats}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ]),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: isHovered ? Colors.red : Colors.black,
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

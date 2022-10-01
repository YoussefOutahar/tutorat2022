import 'package:flutter/material.dart';

class CategorySelectionShip extends StatefulWidget {
  const CategorySelectionShip({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<CategorySelectionShip> createState() => _CategorySelectionShipState();
}

class _CategorySelectionShipState extends State<CategorySelectionShip>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isHovered = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: ((event) {
        setState(() {
          _animationController.forward();
          isHovered = true;
        });
      }),
      onExit: ((event) {
        setState(() {
          _animationController.reverse();
          isHovered = false;
        });
      }),
      child: GestureDetector(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chip(
          label: Text(widget.title),
          elevation: (1 - _animationController.value) * 8 + 4,
          backgroundColor: Colors.red,
        ),
      )),
    );
  }
}

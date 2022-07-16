import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminScreenState();
}

/*
Card Content:

  - (Beta) Description Image

  - Module name

  - N of tutors
  - N of students
  - Availability(Teams, Class)

  - Add Button
*/

class _AdminScreenState extends State<AdminPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInQuart));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Center(
                  child: Stack(children: [
                    Opacity(
                      opacity: _animation.value,
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/large_UIR_Blurred.jpg'),
                      ),
                    ),
                    Opacity(
                      opacity: 1.0 - _animation.value,
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/large_UIR.jpg'),
                      ),
                    )
                  ]),
                );
              }),
        ),
        FloatingActionButton(
            onPressed: initState, child: const Icon(Icons.add)),
      ],
    );
  }
}

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ModuleCarousel extends StatefulWidget {
  const ModuleCarousel({Key? key, required this.myModules, required this.size})
      : super(key: key);

  final List<Widget> myModules;
  final Size size;

  @override
  State<ModuleCarousel> createState() => _ModuleCarouselState();
}

class _ModuleCarouselState extends State<ModuleCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height * 0.3,
      child: Row(children: [
        IconButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            icon: const Icon(Icons.keyboard_arrow_left_rounded)),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  controller: _pageController,
                  children: widget.myModules,
                ),
              ),
              DotsIndicator(
                dotsCount: widget.myModules.length,
                position: double.parse(_currentPage.toString()),
                decorator: const DotsDecorator(
                  activeColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        IconButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            icon: const Icon(Icons.keyboard_arrow_right_rounded))
      ]),
    );
  }
}

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
            onPressed: () {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            icon: const Icon(Icons.arrow_left)),
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
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            icon: const Icon(Icons.arrow_right))
      ]),
    );
  }
}

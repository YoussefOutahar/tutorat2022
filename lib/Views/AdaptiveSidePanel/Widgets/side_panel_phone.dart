// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';

class PhoneVersion extends StatefulWidget {
  const PhoneVersion({
    Key? key,
    required this.tabs,
    required this.isSelected,
    required this.tabData,
  }) : super(key: key);

  final List<Widget> tabs;
  final List<List<Object>> tabData;
  final List<bool> isSelected;

  @override
  State<PhoneVersion> createState() => _PhoneVersionState();
}

class _PhoneVersionState extends State<PhoneVersion>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  int currentPage = 0;
  String? currentTitle;
  Color? currentColor;

  Widget? _buildBody() {
    for (bool selected in widget.isSelected) {
      if (selected) {
        return widget.tabs[widget.isSelected.indexOf(selected)];
      }
    }
    return Container(
        color: Colors.white, child: const Center(child: Text("Error 404")));
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: _buildBody(),
          bottomNavigationBar: SafeArea(
            child: CubertoBottomBar(
              onTabChangedListener:
                  (int position, String title, Color? tabColor) {
                for (int i = 0; i < widget.isSelected.length; i++) {
                  if (i != position) {
                    widget.isSelected[i] = false;
                  }
                }
                setState(() {
                  widget.isSelected[position] = true;
                });
              },
              tabs: widget.tabData
                  .map((e) => TabData(
                      iconData: e[0] as IconData, title: e[1] as String))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

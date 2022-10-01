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

class _PhoneVersionState extends State<PhoneVersion> {
  int currentPage = 0;
  String? currentTitle;
  Color? currentColor;

  Widget? _buildBody() {
    for (bool selected in widget.isSelected) {
      if (selected) {
        currentPage = widget.isSelected.indexOf(selected);
        return widget.tabs[widget.isSelected.indexOf(selected)];
      }
    }
    return Container(
        color: Colors.white, child: const Center(child: Text("Error 404")));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CubertoBottomBar(
            selectedTab: currentPage,
            barBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
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
                      key: Key((widget.tabData.indexOf(e) + 50).toString()),
                      iconData: e[0] as IconData,
                      title: e[1] as String,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

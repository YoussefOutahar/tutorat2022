import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:tutorat2022/Widgets/AdaptiveSidePanel/side_panel_phone.dart';
import 'package:tutorat2022/Widgets/AdaptiveSidePanel/side_panel_web.dart';

class AdaptiveSidePanel extends StatefulWidget {
  const AdaptiveSidePanel({Key? key, required this.tabs, required this.tabData})
      : super(key: key);

  final List<Widget> tabs;
  final List<List<Object>> tabData;

  @override
  State<AdaptiveSidePanel> createState() => _AdaptiveSidePanelState();
}

class _AdaptiveSidePanelState extends State<AdaptiveSidePanel> {
  late List<bool> _isSelected;

  _buildTiles() {
    _isSelected = List.generate(widget.tabs.length, (index) => false);
    _isSelected[0] = true;
  }

  @override
  void initState() {
    _buildTiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool isPortrait = constraints.maxWidth < constraints.maxHeight;
      double aspectRatio = isPortrait
          ? constraints.maxWidth / constraints.maxHeight
          : constraints.maxHeight / constraints.maxWidth;
      if (isPortrait) {
        return Scaffold(
          body: Hero(
            tag: "MainPage",
            child: PhoneVersion(
              tabs: widget.tabs,
              isSelected: _isSelected,
              tabData: widget.tabData,
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Hero(
            tag: "MainPage",
            child: WebSidePanel(
              tabData: widget.tabData,
              isSelected: _isSelected,
              aspectRatio: aspectRatio,
              tabs: widget.tabs,
            ),
          ),
        );
      }
    });
  }
}

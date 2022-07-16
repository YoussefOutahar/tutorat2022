import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'Widgets/side_panel_phone.dart';
import 'Widgets/side_panel_web.dart';

class AdaptiveSidePanel extends StatefulWidget {
  const AdaptiveSidePanel({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<AdaptiveSidePanel> createState() => _AdaptiveSidePanelState();
}

class _AdaptiveSidePanelState extends State<AdaptiveSidePanel> {
  List<bool> _isSelected = [false, false, false, false];
  List<List<Object>> tabData = [
    [Iconsax.home3, "Home"],
    [Icons.history, "History"],
    [Icons.home, "Home"],
    [Icons.history, "History"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "MainPage",
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isPortrait = constraints.maxWidth < constraints.maxHeight;
            double aspectRatio = isPortrait
                ? constraints.maxWidth / constraints.maxHeight
                : constraints.maxHeight / constraints.maxWidth;
            if (isPortrait) {
              return PhoneSidePanel(body: widget.body);
            } else {
              return WebSidePanel(
                tabData: tabData,
                isSelected: _isSelected,
                aspectRatio: aspectRatio,
                body: widget.body,
              );
            }
          },
        ),
      ),
    );
  }
}

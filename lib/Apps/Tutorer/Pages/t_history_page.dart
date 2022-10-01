import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class THistoryPage extends StatefulWidget {
  const THistoryPage({Key? key}) : super(key: key);

  @override
  State<THistoryPage> createState() => _THistoryPageState();
}

class _THistoryPageState extends State<THistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HistoryEvent(
              date: '',
              index: index,
              title: '',
            ),
          );
        },
      ),
    );
  }
}

class HistoryEvent extends StatefulWidget {
  const HistoryEvent({
    Key? key,
    required this.title,
    required this.date,
    required this.index,
  }) : super(key: key);

  final int index;
  final String title;
  final String date;

  @override
  State<HistoryEvent> createState() => _HistoryEventState();
}

class _HistoryEventState extends State<HistoryEvent> {
  bool isHovered = false;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Spacer(),
                        Icon(
                          Iconsax.arrow_2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.date,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

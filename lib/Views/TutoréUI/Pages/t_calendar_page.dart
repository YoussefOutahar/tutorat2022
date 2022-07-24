import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TCalendarPage extends StatelessWidget {
  const TCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SfCalendar(
        view: CalendarView.schedule,
        scheduleViewSettings: const ScheduleViewSettings(),
        //   timeSlotViewSettings: const TimeSlotViewSettings(
        //       startHour: 9,
        //       endHour: 16,
        //       nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
      ),
    );
  }
}

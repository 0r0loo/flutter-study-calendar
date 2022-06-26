import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calendar(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0), color: Colors.grey[200]);

    final defaultTextStyle =
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700);

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: this.focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
      ),
      onDaySelected: this.onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (this.selectedDay == null) return false;
        return date.year == this.selectedDay!.year &&
            date.month == this.selectedDay!.month &&
            date.day == this.selectedDay!.day;
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false, // 오늘날짜
        defaultDecoration: defaultBoxDeco, // 평일
        weekendDecoration: defaultBoxDeco, // 주말
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            width: 1.0,
            color: PRIMARY_COLOR,
          ),
        ), // 선택된 날짜
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR),
      ),
    );
  }
}

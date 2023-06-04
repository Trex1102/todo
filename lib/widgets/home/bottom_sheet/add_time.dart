import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildTimeVersion extends StatefulWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  BuildTimeVersion({
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  _BuildTimeVersionState createState() => _BuildTimeVersionState();
}

class _BuildTimeVersionState extends State<BuildTimeVersion> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: widget.selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              ).then((newDate) {
                if (newDate != null) {
                  widget.onDateChanged(newDate);
                }
              });
            },
            child: Text(
              DateFormat('yyyy-MM-dd').format(widget.selectedDate),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(width: 40),
          GestureDetector(
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: widget.selectedTime,
              ).then((newTime) {
                if (newTime != null) {
                  final updatedDateTime = DateTime(
                    widget.selectedDate.year,
                    widget.selectedDate.month,
                    widget.selectedDate.day,
                    newTime.hour,
                    newTime.minute,
                  );
                  widget.onTimeChanged(newTime);
                  widget.onDateChanged(updatedDateTime);
                }
              });
            },
            child: Text(
              DateFormat.Hm().format(DateTime(
                widget.selectedDate.year,
                widget.selectedDate.month,
                widget.selectedDate.day,
                widget.selectedTime.hour,
                widget.selectedTime.minute,
              )),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'common/text_field.dart';
import 'add_time.dart';

class BuildReminderVersion extends StatefulWidget {
  final TextEditingController reminderNoteController;
  final bool isReminderNoteSelected;
  final VoidCallback toggleReminderNoteSelection;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<TimeOfDay> onTimeChanged;

  BuildReminderVersion({
    required this.reminderNoteController,
    required this.isReminderNoteSelected,
    required this.toggleReminderNoteSelection,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateChanged,
    required this.onTimeChanged,
  });

  @override
  _BuildReminderVersionState createState() => _BuildReminderVersionState();
}

class _BuildReminderVersionState extends State<BuildReminderVersion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTimeVersion(
          selectedDate: widget.selectedDate,
          selectedTime: widget.selectedTime,
          onDateChanged: widget.onDateChanged,
          onTimeChanged: widget.onTimeChanged,
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: widget.toggleReminderNoteSelection,
          child: TaskTextField(
            controller: widget.reminderNoteController,
            isSelected: widget.isReminderNoteSelected,
            labelText: 'Add Note..',
          ),
        ),
      ],
    );
  }
}

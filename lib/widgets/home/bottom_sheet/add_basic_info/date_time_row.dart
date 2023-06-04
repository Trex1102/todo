

import 'package:flutter/material.dart';

class TaskDateTimeRow extends StatelessWidget {
  final String formattedDate;
  final TimeOfDay selectedTime;

  const TaskDateTimeRow({
    Key? key,
    required this.formattedDate,
    required this.selectedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          formattedDate,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          selectedTime.format(context),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
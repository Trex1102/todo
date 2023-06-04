

import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isSelected;
  final String? labelText;
  final int minLines;
  final int maxLines;

  const TaskTextField({
    Key? key,
    required this.controller,
    required this.isSelected,
    this.labelText,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap event
      },
      child: TextField(
        controller: controller,
        enabled: !isSelected,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          labelText: isSelected ? null : labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'common/text_field.dart';

class BuildLocationVersion {
  static Widget build({
    required TextEditingController locationController,
    required bool isLocationSelected,
    required VoidCallback toggleLocationSelection,
    }) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleLocationSelection,
          child: TaskTextField(
            controller: locationController,
            isSelected: isLocationSelected,
            labelText: 'Add Location..',
          ),
        )
      ],
    );
  }
}

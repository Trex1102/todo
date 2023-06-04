import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../models/category.dart';
import '../common/text_field.dart';
import 'date_time_row.dart';
import 'category_dropdown.dart';

class BuildHomeVersion {
  static Widget build({
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required TextEditingController categoryController,
    required bool isTitleSelected,
    required bool isDescriptionSelected,
    required bool isCategorySelected,
    required DateTime selectedDate,
    required TimeOfDay selectedTime,
    required void Function(Category?) onCategoryChanged,
    required Category? selectedCategory,
    required VoidCallback toggleTitleSelection,
    required VoidCallback toggleNoteSelection,
    required VoidCallback toggleCategorySelection,
  }) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    return Column(
      children: [
        GestureDetector(
          onTap: toggleTitleSelection,
          child: TaskTextField(
            controller: titleController,
            isSelected: isTitleSelected,
            labelText: 'Add Task Name..',
          ),
        ),
        const SizedBox(height: 4),
        TaskDateTimeRow(
          formattedDate: formattedDate,
          selectedTime: selectedTime,
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: toggleNoteSelection,
          child: TaskTextField(
            isSelected: isDescriptionSelected,
            controller: descriptionController,
            labelText: 'Add Description..',
            minLines: 3,
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: toggleCategorySelection,
          child: CategoryDropdown(
            controller: categoryController,
            isSelected: isCategorySelected,
            selectedCategory: selectedCategory,
            onCategoryChanged: onCategoryChanged,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

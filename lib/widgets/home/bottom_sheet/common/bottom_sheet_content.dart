
import 'package:flutter/material.dart';
import '../add_basic_info/add_basic_info.dart';
import '../add_time.dart';
import '../add_reminder.dart';
import '../add_location.dart';
import '../../../../models/category.dart';

Widget buildBottomSheetContent(BuildContext context, int currentIndex,
    TextEditingController titleController,
    TextEditingController descriptionController,
    TextEditingController categoryController,
    bool isTitleSelected,
    bool isDescriptionSelected,
    bool isCategorySelected,
    DateTime currentDate,
    TimeOfDay currentTime,
    DateTime selectedTaskDate,
    TimeOfDay selectedTaskTime,
    DateTime selectedReminderDate,
    TimeOfDay selectedReminderTime,
    VoidCallback toggleTitleSelection,
    VoidCallback toggleNoteSelection,
    VoidCallback toggleCategorySelection,
    TextEditingController reminderNoteController,
    bool isReminderNoteSelected,
    VoidCallback toggleReminderNoteSelection,
    void Function(DateTime) onTaskDateChanged,
    void Function(TimeOfDay) onTaskTimeChanged,
    void Function(DateTime) onReminderDateChanged,
    void Function(TimeOfDay) onReminderTimeChanged,
    Category? selectedCategory,
    void Function(Category?) onCategoryChanged,
    TextEditingController locationController,
    bool isLocationSelected,
    VoidCallback toggleLocationSelection,) {
  if (currentIndex == 0) {
    return BuildHomeVersion.build(
      titleController: titleController,
      descriptionController: descriptionController,
      categoryController: categoryController,
      isTitleSelected: isTitleSelected,
      isDescriptionSelected: isDescriptionSelected,
      isCategorySelected: isCategorySelected,
      selectedDate: currentDate,
      selectedTime: currentTime,
      toggleTitleSelection: toggleTitleSelection,
      toggleNoteSelection: toggleNoteSelection,
      toggleCategorySelection: toggleCategorySelection,
      selectedCategory: selectedCategory,
      onCategoryChanged: onCategoryChanged,
    );
  } else if (currentIndex == 1) {
    return BuildTimeVersion(
      selectedDate: selectedTaskDate,
      selectedTime: selectedTaskTime,
      onDateChanged: onTaskDateChanged,
      onTimeChanged: onTaskTimeChanged,
    );
  } else if (currentIndex == 2) {
    return BuildLocationVersion.build(
      locationController: locationController,
      isLocationSelected: isLocationSelected,
      toggleLocationSelection: toggleLocationSelection,);
  } else {
    return BuildReminderVersion(
      reminderNoteController: reminderNoteController,
      isReminderNoteSelected: isReminderNoteSelected,
      toggleReminderNoteSelection: toggleReminderNoteSelection,
      selectedDate: selectedReminderDate,
      selectedTime: selectedReminderTime,
      onDateChanged: onReminderDateChanged,
      onTimeChanged: onReminderTimeChanged,
    );
  }
}

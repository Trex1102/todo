import 'package:flutter/material.dart';
import 'common/drag_down_icon.dart';
import 'common/bottom_row.dart';
import 'common/bottom_sheet_content.dart';
import '../../../../models/category.dart';
import '../../../../models/task.dart';

class TaskBottomSheet extends StatefulWidget {
  final Task? task;
  final Function(Task?) onUpdateTask;
  TaskBottomSheet({Key? key, required this.task, required this.onUpdateTask}) : super(key: key);
  


  @override
  // ignore: library_private_types_in_public_api
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  bool _isTitleSelected = false;
  bool _isCategorySelected = false;
  bool _isDescriptionSelected = false;
  int _currentIndex = 0;

  DateTime _currentDate = DateTime.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  late DateTime _selectedTaskDate = DateTime.now();
  late TimeOfDay _selectedTaskTime = TimeOfDay.now();

  late DateTime _selectedReminderDate = DateTime.now();
  late TimeOfDay _selectedReminderTime = TimeOfDay.now();

  final TextEditingController _reminderNoteController = TextEditingController();
  bool _isReminderNoteSelected = false;

  Category? _selectedCategory;

  final TextEditingController _locationController = TextEditingController();
  bool _isLocationSelected = false;

  Task? currentTask;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _initializeFields(widget.task!);
    }
  }

  void _initializeFields(Task task) {
    _titleController.text = task.title;
    _descriptionController.text = task.description.toString();
    _currentDate = task.dateOfCreation;
    _currentTime = task.timeOfCreation;
    _selectedCategory = task.category;
    _selectedTaskDate = task.dateOfTask;
    _selectedTaskTime = task.timeOfTask;
    _selectedReminderDate = task.dateOfReminder;
    _selectedReminderTime = task.timeOfReminder;
    _reminderNoteController.text = task.reminderNote.toString();
    _locationController.text = task.location.toString();
  }

  void createTask() {
    currentTask = Task(
      title: _titleController.text,
      description: _descriptionController.text,
      category: _selectedCategory,
      dateOfCreation: _currentDate,
      timeOfCreation: _currentTime,
      dateOfTask: _selectedTaskDate,
      timeOfTask: _selectedTaskTime,
      dateOfReminder: _selectedReminderDate,
      timeOfReminder: _selectedReminderTime,
      reminderNote: _reminderNoteController.text,
      location: _locationController.text,
      isCompleted: false,
    );

    widget.onUpdateTask(currentTask);
  }

  void printTask() {
    if (currentTask != null) {
      print(currentTask?.title);
    } else {
      print('No task created yet.');
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleTitleSelection() {
    setState(() {
      _isTitleSelected = !_isTitleSelected;
    });
  }

  void _toggleNoteSelection() {
    setState(() {
      _isDescriptionSelected = !_isDescriptionSelected;
    });
  }

  void _toggleCategorySelection() {
    setState(() {
      _isCategorySelected = !_isCategorySelected;
    });
  }

  void _toggleReminderNoteSelection() {
    setState(() {
      _isReminderNoteSelected = !_isReminderNoteSelected;
    });
  }

  void _toggleLocationSelection() {
    setState(() {
      _isLocationSelected = !_isLocationSelected;
    });
  }

  void _onTaskDateChanged(DateTime newDate) {
    setState(() {
      _selectedTaskDate = newDate;
    });
  }

  void _onTaskTimeChanged(TimeOfDay newTime) {
    setState(() {
      _selectedTaskTime = newTime;
    });
  }

  void _onReminderDateChanged(DateTime newDate) {
    setState(() {
      _selectedReminderDate = newDate;
    });
  }

  void _onReminderTimeChanged(TimeOfDay newTime) {
    setState(() {
      _selectedReminderTime = newTime;
    });
  }

  void _onCategoryChanged(Category? newCategory) {
    setState(() {
      _selectedCategory = newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: GestureDetector(
                onTap: () {},
                child: DragDownIcon(),
              ),
            ),
            const SizedBox(height: 30),
            buildBottomSheetContent(
              context,
              _currentIndex,
              _titleController,
              _descriptionController,
              _categoryController,
              _isTitleSelected,
              _isDescriptionSelected,
              _isCategorySelected,
              _currentDate,
              _currentTime,
              _selectedTaskDate,
              _selectedTaskTime,
              _selectedReminderDate,
              _selectedReminderTime,
              _toggleTitleSelection,
              _toggleNoteSelection,
              _toggleCategorySelection,
              _reminderNoteController,
              _isReminderNoteSelected,
              _toggleReminderNoteSelection,
              _onTaskDateChanged,
              _onTaskTimeChanged,
              _onReminderDateChanged,
              _onReminderTimeChanged,
              _selectedCategory,
              _onCategoryChanged,
              _locationController,
              _isLocationSelected,
              _toggleLocationSelection,
            ),
            TaskBottomRow(
              currentIndex: _currentIndex,
              onTabSelected: _onTabSelected,
              onCreateTask: createTask,
              onPrintTask: printTask,
            ),
          ],
        ),
      ),
    );
  }
}

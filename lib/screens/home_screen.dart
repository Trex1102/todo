import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/common/bottom_navigation_bar_widget.dart';
import '../widgets/home/bottom_sheet/bottom_sheet.dart';
import 'user_profile_screen.dart';
import '../models/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _currentIndex = 0;

  Task? _task = Task(
    title: 'Task 1',
    description: 'Description 1',
    category: null,
    dateOfCreation: DateTime.now(),
    timeOfCreation: TimeOfDay.now(),
    dateOfTask: DateTime.now(),
    timeOfTask: TimeOfDay.now(),
    dateOfReminder: DateTime.now(),
    timeOfReminder: TimeOfDay.now(),
    reminderNote: '',
    location: '',
    isCompleted: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTaskList(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddTaskBottomSheet(context);
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserProfileScreen(),
        ),
      );
    }
  }

  Widget _buildTaskList() {
    // Build your task list widget
    // ...
    return Container();
  }

  void _openAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return TaskBottomSheet(
          task: _task,
          onUpdateTask: (updatedTask) {
            setState(() {
              _task = updatedTask;
            });
          },
        );
      },
    );
  }
}

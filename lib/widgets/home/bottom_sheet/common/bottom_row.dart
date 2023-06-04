import 'package:flutter/material.dart';
import 'bottom_navigation_bar_widget.dart';

class TaskBottomRow extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  final VoidCallback? onCreateTask;
  final VoidCallback? onPrintTask;

  const TaskBottomRow({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
    this.onCreateTask,
    this.onPrintTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BottomNavigationBarWidget(
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
          ),
        ),
        const SizedBox(width: 60),
        Container(
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              onCreateTask?.call();
              onPrintTask?.call();
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: const Text(
              'ADD',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/screens/intro_screen.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/screens/user_profile_screen.dart';
// Import other necessary screens

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.amber,
        fontFamily: 'SourceRegular',
      ),
      initialRoute: '/intro', 
      routes: {
        '/intro': (context) => const IntroScreen(),
        '/taskList': (context) => const TaskListScreen(),
        '/profile' : (context) => const UserProfileScreen(),
      },
    );
  }
}

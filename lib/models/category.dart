import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color? color;

  Category({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class CategoryDeclaration{

  static List<Category> categories = [
    Category(name: 'Personal', icon: Icons.person, color: Colors.blue),
    Category(name: 'Work', icon: Icons.work, color: Colors.orange),
    Category(name: 'Errands', icon: Icons.shopping_cart, color: Colors.green),
    Category(name: 'Shopping', icon: Icons.shopping_bag, color: Colors.purple),
    Category(name: 'Health & Fitness', icon: Icons.fitness_center, color: Colors.red),
    Category(name: 'Home & Chores', icon: Icons.home, color: Colors.teal),
    Category(name: 'Education', icon: Icons.school, color: Colors.indigo),
    Category(name: 'Finance', icon: Icons.attach_money, color: Colors.amber),
    Category(name: 'Social', icon: Icons.people, color: Colors.pink),
    Category(name: 'Entertainment', icon: Icons.music_note, color: Colors.deepPurple),
    Category(name: 'Travel', icon: Icons.flight, color: Colors.cyan),
    Category(name: 'Projects', icon: Icons.folder, color: Colors.lime),
    Category(name: 'Goals', icon: Icons.star, color: Colors.yellow),
  ];

}

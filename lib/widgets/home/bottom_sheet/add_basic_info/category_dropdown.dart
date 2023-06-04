import 'package:flutter/material.dart';
import '../../../../models/category.dart';

class CategoryDropdown extends StatefulWidget {
  final TextEditingController controller;
  final bool isSelected;
  final Category? selectedCategory;
  final void Function(Category?) onCategoryChanged;

  CategoryDropdown({
    required this.controller,
    required this.isSelected,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  List<Category> categories = CategoryDeclaration.categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Category>(
          value: widget.selectedCategory,
          hint: const Text(
            'Select Category',
            style: TextStyle(color: Colors.grey),
          ),
          isExpanded: true,
          icon: const SizedBox.shrink(),
          onChanged: (Category? newValue) {
            setState(() {
              widget.onCategoryChanged(newValue);
              widget.controller.text = newValue?.name ?? '';
            });
          },
          items: categories.map((Category category) {
            return DropdownMenuItem<Category>(
              value: category,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        category.icon,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        category.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: category.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

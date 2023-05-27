import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class CategoryInput extends StatelessWidget {
  const CategoryInput({super.key, required this.value, required this.onChange});

  final Category value;
  final void Function(Category?) onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: Category.values
          .map((category) => DropdownMenuItem(
                value: category,
                child: Text(
                  category.name.toUpperCase(),
                ),
              ))
          .toList(),
      onChanged: onChange,
    );
  }
}

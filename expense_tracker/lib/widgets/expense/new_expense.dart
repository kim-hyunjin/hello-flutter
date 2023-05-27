import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title, amount, date and category was entered.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  ),
                ],
              ));
      return;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));

    Navigator.pop(context);
  }

  void _handleCategoryChange(Category? category) {
    if (category == null) {
      return;
    }
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleInput.withExpanded(controller: _titleController),
                        AmountInput.withExpanded(controller: _amountController),
                      ],
                    )
                  else
                    TitleInput(controller: _titleController),
                  if (width >= 600)
                    Row(
                      children: [
                        CategoryInput(
                            value: _selectedCategory,
                            onChange: _handleCategoryChange),
                        DateInput(
                          onClick: _presentDatePicker,
                          value: _selectedDate,
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        AmountInput.withExpanded(controller: _amountController),
                        const SizedBox(
                          width: 16,
                        ),
                        DateInput(
                          onClick: _presentDatePicker,
                          value: _selectedDate,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      if (width < 600)
                        CategoryInput(
                            value: _selectedCategory,
                            onChange: _handleCategoryChange),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TitleInput extends StatelessWidget {
  const TitleInput({super.key, required this.controller})
      : withExpanded = false;

  const TitleInput.withExpanded({super.key, required this.controller})
      : withExpanded = true;

  final TextEditingController controller;
  final bool withExpanded;

  @override
  Widget build(BuildContext context) {
    var input = TextField(
      controller: controller,
      maxLength: 50,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );

    if (withExpanded) {
      return Expanded(child: input);
    } else {
      return input;
    }
  }
}

class AmountInput extends StatelessWidget {
  const AmountInput({super.key, required this.controller})
      : withExpanded = false;

  const AmountInput.withExpanded({super.key, required this.controller})
      : withExpanded = true;

  final TextEditingController controller;
  final bool withExpanded;

  @override
  Widget build(BuildContext context) {
    var input = TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixText: '\$ ',
        label: Text('Amount'),
      ),
    );

    if (withExpanded) {
      return Expanded(child: input);
    } else {
      return input;
    }
  }
}

class DateInput extends StatelessWidget {
  const DateInput({super.key, this.value, required this.onClick});

  final DateTime? value;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value == null ? 'No date selected' : formatter.format(value!)),
          IconButton(
            onPressed: onClick,
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }
}

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

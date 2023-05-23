import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answerd x out of y questions correctly'),
          const SizedBox(
            height: 30,
          ),
          const Text('List of questions...'),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: const Text('restart!')),
        ],
      ),
    );
  }
}

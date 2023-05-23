import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuiestionSreenState();
  }
}

class _QuiestionSreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'question',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(text: 'answer1', onTab: () {}),
          AnswerButton(text: 'answer2', onTab: () {}),
          AnswerButton(text: 'answer3', onTab: () {}),
        ],
      ),
    );
  }
}

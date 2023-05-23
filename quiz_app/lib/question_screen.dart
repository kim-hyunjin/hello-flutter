import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/quiz_list.dart';
import 'package:quiz_app/models/quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuiestionSreenState();
  }
}

class _QuiestionSreenState extends State<QuestionScreen> {
  int currentQuizIndex = 0;

  @override
  Widget build(BuildContext context) {
    Quiz currentQuiz = quizList[currentQuizIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuiz.question,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuiz.options
                .map((e) => AnswerButton(text: e, onTab: () {})),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/result_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.quizList,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<Quiz> quizList;
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      Quiz quiz = quizList[i];
      summary.add({
        'index': i,
        'question': quiz.question,
        'correct_answer': quiz.correctAnswer,
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();

    final numOfCorrectAnswer = summaryData.where(
      (element) {
        return element['correct_answer'] == element['user_answer'];
      },
    ).length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answerd $numOfCorrectAnswer out of ${quizList.length} questions correctly!',
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 120, 165),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ResultSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              onRestart();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.restart_alt),
            label: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}

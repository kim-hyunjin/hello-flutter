import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/quiz_list.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuiestionSreenState();
  }
}

class _QuiestionSreenState extends State<QuestionScreen> {
  int currentQuizIndex = 0;
  int maxQuizIndex = quizList.length - 1;

  void goToNextQuiz() {
    if (currentQuizIndex < maxQuizIndex) {
      setState(() {
        currentQuizIndex++;
      });
    }
  }

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
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuiz.getShuffledOptions().map((e) => AnswerButton(
                  text: e,
                  onTab: () {
                    goToNextQuiz();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

enum ScreenType { start, question }

class _QuizAppState extends State<QuizApp> {
  ScreenType screenType = ScreenType.start;

  void changeScreen(ScreenType type) {
    setState(() {
      screenType = type;
    });
  }

  Widget renderScreen() {
    Widget activeScreen;
    switch (screenType) {
      case ScreenType.start:
        activeScreen = StartScreen(() {
          changeScreen(ScreenType.question);
        });
        break;
      case ScreenType.question:
        activeScreen = const QuestionScreen();
        break;
    }

    return activeScreen;
  }

  // late Widget activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(changeScreen);
  // }

  // void changeScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.deepPurple),
          child: renderScreen(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    return const Center(child: Text("question"));
  }
}

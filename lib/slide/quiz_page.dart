import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  static FlutterDeckSlideWidget get slide => QuizPage().withSlideConfiguration(
    FlutterDeckSlideConfiguration(route: '/quiz'),
  );

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedTo.spring(
              globalKey: GlobalObjectKey('render-object'),
              slidingFrom: Offset(0, 600),
              child: Text(
                'QUIZ',
                style: FlutterDeckTheme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alliance_2025/slide/animated_to_page.dart';
import 'package:flutter_alliance_2025/slide/basic_demo_page.dart';
import 'package:flutter_alliance_2025/slide/customize_renderobject_page.dart';
import 'package:flutter_alliance_2025/slide/draggable_demo_page.dart';
import 'package:flutter_alliance_2025/slide/framework_figure_page.dart';
import 'package:flutter_alliance_2025/slide/global_key_page.dart';
import 'package:flutter_alliance_2025/slide/graph_demo_page.dart';
import 'package:flutter_alliance_2025/slide/height_quiz_answer_page.dart';
import 'package:flutter_alliance_2025/slide/height_quiz_page.dart';
import 'package:flutter_alliance_2025/slide/how_game_changer_page.dart';
import 'package:flutter_alliance_2025/slide/how_to_customize_page.dart';
import 'package:flutter_alliance_2025/slide/implicit_handy_page.dart';
import 'package:flutter_alliance_2025/slide/next_challenge_page.dart';
import 'package:flutter_alliance_2025/slide/not_straightforward_page.dart';
import 'package:flutter_alliance_2025/slide/quiz_page.dart';
import 'package:flutter_alliance_2025/slide/render_object_page.dart';
import 'package:flutter_alliance_2025/slide/strategy_page.dart';
import 'package:flutter_alliance_2025/slide/thanks_page.dart';
import 'package:flutter_alliance_2025/slide/up_to_you_page.dart';
import 'package:flutter_alliance_2025/slide/we_want_page.dart';
import 'package:flutter_alliance_2025/slide/what_is_implicit_page.dart';
import 'package:flutter_alliance_2025/slide/title_page.dart';
import 'package:flutter_alliance_2025/slide/two_approaches_page.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _presentationDuration = Duration(minutes: 30);

void main() {
  runApp(const MainApp());
}

final slides = [
  TitlePage.slide,
  TwoApproachesPage.slide,
  WhatIsImplicitPage.slide,
  QuizPage.slide,
  HeightQuizPage.slide,
  RenderObjectPage.slide,
  FrameworkFigurePage.slide,
  HeightQuizAnswerPage.slide,
  StrategyPage.slide,
  NotStraightForwardPage.slide,
  WeWantPage.slide,
  CustomizeRenderObjectPage.slide,
  HotToCustomizePage.slide,
  AnimatedToPage.slide,
  BasicDemoPage.slide,
  ImplicitHandyPage.slide,
  HowGameChangerPage.slide,
  DraggableDemoPage.slide,
  GraphDemoPage.slide,
  UpToYouPage.slide,
  NextChallengePage.slide,
  GlobalKeyPage.slide,
  ThanksPage.slide,
];

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isTimerRunning = false;
  final _startTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _isTimerRunning = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          FlutterDeckApp(
            darkTheme: FlutterDeckThemeData.dark().copyWith(
              textTheme: const FlutterDeckTextTheme(
                title: TextStyle(fontSize: 40),
                subtitle: TextStyle(fontSize: 36),
                bodyLarge: TextStyle(fontSize: 30),
                bodyMedium: TextStyle(fontSize: 24),
              ),
            ),
            configuration: FlutterDeckConfiguration(
              // slideSize: FlutterDeckSlideSize.custom(width: 1920, height: 1080),
            ),
            themeMode: ThemeMode.dark,
            slides: slides,
          ),
          Positioned(
            top: 10,
            left: _isTimerRunning ? null : 10,
            right: _isTimerRunning ? 10 : null,
            child: AnimatedTo.curve(
              globalKey: GlobalObjectKey('timer'),
              duration: _presentationDuration,
              curve: Curves.linear,
              child: _Timer(startTime: _startTime),
            ),
          ),
        ],
      ),
    );
  }
}

class _Timer extends StatefulWidget {
  const _Timer({required this.startTime});

  final DateTime startTime;

  @override
  State<_Timer> createState() => _TimerState();
}

class _TimerState extends State<_Timer> {
  bool _isLetterMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final duration =
        _presentationDuration - DateTime.now().difference(widget.startTime);
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          setState(() => _isLetterMode = !_isLetterMode);
        },
        child: Container(
          width: 120,
          height: 60,
          decoration: BoxDecoration(
            color: _isLetterMode ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: _isLetterMode ? Border.all(color: Colors.white) : null,
          ),
          child: Center(
            child: _isLetterMode
                ? Text(
                    '${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Icon(
                    Icons.timer_outlined,
                    color: Colors.grey.shade700,
                    size: 32,
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class UpToYouPage extends StatefulWidget {
  const UpToYouPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      UpToYouPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/up-to-you'),
      );

  @override
  State<UpToYouPage> createState() => _UpToYouPageState();
}

class _UpToYouPageState extends State<UpToYouPage> {
  bool _showNext = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => _showNext = !_showNext);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedTo.spring(
                globalKey: GlobalObjectKey('what-to-make'),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  style: FlutterDeckTheme.of(context).textTheme.title.copyWith(
                    color: _showNext ? Colors.grey : Colors.white,
                  ),
                  child: Text('What UI to make?'),
                ),
              ),
              if (_showNext) ...[
                Gap(100),
                AnimatedTo.spring(
                  globalKey: GlobalObjectKey('up-to-you'),
                  slidingFrom: Offset(0, 1000),
                  child: Text(
                    'Up to YOU! 🧩',
                    style: FlutterDeckTheme.of(
                      context,
                    ).textTheme.title.copyWith(fontSize: 60),
                  ),
                ),
                Gap(200),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

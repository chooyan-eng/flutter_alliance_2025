import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class RenderObjectPage extends StatefulWidget {
  const RenderObjectPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      RenderObjectPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/render-object'),
      );

  @override
  State<RenderObjectPage> createState() => _RenderObjectPageState();
}

class _RenderObjectPageState extends State<RenderObjectPage> {
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
                globalKey: GlobalObjectKey('render-object-question'),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  style: FlutterDeckTheme.of(context).textTheme.title.copyWith(
                    color: _showNext ? Colors.grey : Colors.white,
                  ),
                  child: Text('Q: Who knows?'),
                ),
              ),
              if (_showNext) ...[
                Gap(100),
                AnimatedTo.spring(
                  globalKey: GlobalObjectKey('render-object'),
                  slidingFrom: Offset(0, 1000),
                  child: Text(
                    'A: RenderObject',
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

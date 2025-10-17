import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class NotStraightForwardPage extends StatefulWidget {
  const NotStraightForwardPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      NotStraightForwardPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/not-straightforward'),
      );

  @override
  State<NotStraightForwardPage> createState() => _NotStraightForwardPageState();
}

class _NotStraightForwardPageState extends State<NotStraightForwardPage> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => _step++);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 32,
            children: [
              AnimatedTo.spring(
                globalKey: GlobalObjectKey('not-straightforward'),
                child: Text(
                  'Does this always work? 🤔',
                  style: FlutterDeckTheme.of(context).textTheme.title.copyWith(
                    color: _step == 0 ? null : Colors.grey.shade800,
                  ),
                ),
              ),
              AnimatedTo.spring(
                globalKey: GlobalObjectKey('not-straightforward-1'),
                child: Opacity(
                  opacity: _step == 0 ? 0 : 1,
                  child: Text(
                    'Maybe No',
                    style: FlutterDeckTheme.of(context).textTheme.title,
                  ),
                ),
              ),
              if (_step > 1)
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 32,
                    children: [
                      Gap(60),
                      AnimatedTo.spring(
                        globalKey: GlobalObjectKey('not-straightforward-2'),
                        slidingFrom: Offset(0, 600),
                        child: Text(
                          '- More complex logic',
                          style: FlutterDeckTheme.of(
                            context,
                          ).textTheme.subtitle,
                        ),
                      ),
                      AnimatedTo.spring(
                        globalKey: GlobalObjectKey('not-straightforward-3'),
                        slidingFrom: Offset(0, 800),
                        child: Text(
                          '- Unnecessary additional widgets',
                          style: FlutterDeckTheme.of(
                            context,
                          ).textTheme.subtitle,
                        ),
                      ),
                      AnimatedTo.spring(
                        globalKey: GlobalObjectKey('not-straightforward-4'),
                        slidingFrom: Offset(0, 1000),
                        child: Text(
                          '- Not capable to implement complicated animations',
                          style: FlutterDeckTheme.of(
                            context,
                          ).textTheme.subtitle,
                        ),
                      ),
                      Gap(120),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

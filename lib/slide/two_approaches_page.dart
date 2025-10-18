import 'package:animated_to/animated_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alliance_2025/widget/code_container.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class TwoApproachesPage extends StatefulWidget {
  const TwoApproachesPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      TwoApproachesPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/two-approaches'),
      );

  @override
  State<TwoApproachesPage> createState() => _TwoApproachesPageState();
}

class _TwoApproachesPageState extends State<TwoApproachesPage>
    with TickerProviderStateMixin {
  double _offsetY = .0;
  bool _isExplicit = true;
  bool _isGapExpanded = false;

  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(
          duration: const Duration(milliseconds: 460),
          vsync: this,
          lowerBound: .0,
          upperBound: 460,
        )..addListener(() {
          setState(() {
            _offsetY = _animationController.value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() => _isExplicit = !_isExplicit);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(100),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 460),
                      curve: Curves.easeIn,
                      height: _isGapExpanded ? 460 : 0,
                      child: SizedBox(height: _isGapExpanded ? 0 : _offsetY),
                    ),
                    Gap(_isGapExpanded ? 0 : _offsetY),
                    Text(
                      'AnimatedTo Changes\nYour Moving Animations\nbut How?',
                      style: FlutterDeckTheme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(child: Container()),
                  Positioned(
                    top: _isExplicit ? 0 : null,
                    bottom: _isExplicit ? null : 0,
                    left: 0,
                    right: 0,
                    child: AnimatedTo.spring(
                      globalKey: GlobalObjectKey('code'),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CodeExplicit(
                            offsetY: _offsetY,
                            onTap: () {
                              _offsetY == 0
                                  ? _animationController.forward()
                                  : _animationController.reverse();
                            },
                          ),
                          Gap(40),
                          _CodeImplicit(
                            isBottom: _isGapExpanded,
                            onTap: () {
                              setState(() => _isGapExpanded = !_isGapExpanded);
                            },
                          ),
                          Gap(200),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _code1 = '''


@override
void initState() {
  super.initState();
''';

final _code2 = '''
  _animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
''';

final _code3 = '''
}
...
''';

final _code4 = '''
onTap: () => _controller.forward(),
''';

final _code5 = '''
...
Column(
  children: [
''';

final _code6 = '    Gap(_controller.value),';
final _code7 = '\n    Text(\'AnimatedTo Changes Your Moving Animations\'),';

class _CodeExplicit extends StatefulWidget {
  const _CodeExplicit({required this.offsetY, required this.onTap});

  final double offsetY;
  final VoidCallback onTap;

  @override
  State<_CodeExplicit> createState() => _CodeExplicitState();
}

class _CodeExplicitState extends State<_CodeExplicit> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      child: CodeContainer(
        isPressed: _isPressed,
        child: Text.rich(
          TextSpan(
            style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: 'late final AnimationController _controller;',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: _code1),
              TextSpan(
                text: _code2,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: _code3),
              TextSpan(
                text: _code4,
                style: TextStyle(
                  color: _isPressed
                      ? Colors.orange.shade900
                      : Colors.orangeAccent,
                ),
              ),
              TextSpan(text: _code5),
              TextSpan(
                text: _code6,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: ' // -> ${widget.offsetY.toInt()}'),
              TextSpan(text: _code7),
            ],
          ),
        ),
      ),
    );
  }
}

final _code11 = '''
AnimatedContainer(
  duration: const Duration(milliseconds: 1000),
  curve: Curves.easeIn,
  height: ''';

final _code12 = '_isBottom';
final _code13 = ' ? ';
final _code14 = '460';
final _code15 = ' : ';
final _code16 = '0';
final _code17 = '''
);
''';

final _code18 = '''

...

onTap: () {
''';

final _code19 = '''
  setState(() => _isBottom = !_isBottom);
''';

final _code20 = '''
}
''';

class _CodeImplicit extends StatefulWidget {
  const _CodeImplicit({required this.onTap, required this.isBottom});
  final VoidCallback onTap;
  final bool isBottom;

  @override
  State<_CodeImplicit> createState() => _CodeImplicitState();
}

class _CodeImplicitState extends State<_CodeImplicit> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      child: CodeContainer(
        isPressed: _isPressed,
        child: Text.rich(
          TextSpan(
            style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: _code11,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(
                text: _code12,
                style: TextStyle(
                  color: widget.isBottom ? Colors.orangeAccent : null,
                ),
              ),
              TextSpan(text: _code13),
              TextSpan(
                text: _code14,
                style: TextStyle(
                  color: widget.isBottom ? Colors.orangeAccent : null,
                ),
              ),
              TextSpan(text: _code15),
              TextSpan(
                text: _code16,
                style: TextStyle(
                  color: widget.isBottom ? null : Colors.orangeAccent,
                ),
              ),
              TextSpan(text: _code17),
              TextSpan(text: _code18),
              TextSpan(
                text: _code19,
                style: TextStyle(
                  color: _isPressed
                      ? Colors.orange.shade900
                      : Colors.orangeAccent,
                ),
              ),
              TextSpan(text: _code20),
            ],
          ),
        ),
      ),
    );
  }
}

library onboarding_anim;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_anim/src/model/indicator_decoration.dart';
import 'package:onboarding_anim/src/model/onboarding_decoration.dart';
import 'package:onboarding_anim/src/model/page.dart';
import 'package:onboarding_anim/src/widget/dots.dart';
import 'package:onboarding_anim/src/widget/next_button.dart';
import 'package:onboarding_anim/src/widget/skip_button.dart';

class OnBoardingScreen extends StatefulWidget {
  /// Dots for default example
  static int dotsDefault = 0;

  /// Linear Progress Bar
  static int dotsLinearProgress = 1;

  /// Dots Small to Large
  static int dotsSmallLarge = 2;

  /// Dots Smaill to Big
  static int dotsSmallBig = 3;

  /// All pages of the onboarding
  final List<PageModel> pages;

  /// Callback when Done button is pressed
  final VoidCallback onDone;

  /// Callback when Skip button is pressed
  final VoidCallback onSkip;

  /// Done button
  final Widget done;

  /// Skip button
  final Widget skip;

  /// Is the Skip button should be display
  ///
  /// @Default `true`
  final bool showSkipButton;

  /// Animation duration in millisecondes
  ///
  /// @Default `300`
  final int animationDuration;

  /// Index of the initial page
  ///
  /// @Default `0`
  final int initialPage;

  /// Dots
  ///
  /// @Default `0`
  final int dotsType;

  /// Indicator decoration
  /// Contain all page customizations, like color active & inactice and shadow
  final IndicatorDecoration indicatorDecoration;

  /// Onboarding decoration
  /// Contain all page customizations, Image, shape etc
  final OnboardingDecoration onboardingDecoration;

  const OnBoardingScreen(
      {Key key,
      @required this.pages,
      @required this.onDone,
      this.done,
      this.skip,
      this.onSkip,
      this.showSkipButton = true,
      this.animationDuration = 300,
      this.initialPage = 0,
      this.dotsType = 0,
      this.indicatorDecoration = const IndicatorDecoration(),
      this.onboardingDecoration})
      : assert(pages != null),
        assert(
          pages.length > 0,
          "You provide at least one page on introduction screen !",
        ),
        assert(onDone != null),
        super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  PageController _controller;
  AnimationController _animationController;
  int _currentPage = 0;
  bool _lastPage = false;
  Animation<double> _scaleAnimation;

  Widget _buildWidget(Widget widget, String text, TextStyle style) {
    return widget ?? Text(text, style: style);
  }

  @override
  void initState() {
    super.initState();

    int initialPage = min(widget.initialPage, widget.pages.length - 1);
    _currentPage = initialPage.toInt();
    _controller = PageController(initialPage: _currentPage, keepPage: true);
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      PageView.builder(
          itemCount: widget.pages.length,
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
              if (_currentPage == widget.pages.length - 1) {
                _lastPage = true;
                _animationController.forward();
              } else {
                _lastPage = false;
                _animationController.reset();
              }
            });
          },
          itemBuilder: (context, index) {
            return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  var page = widget.pages[index];
                  var delta;
                  var y = 1.0;
                  if (_controller.position.haveDimensions) {
                    delta = _controller.page - index;
                    y = 1 - delta.abs().clamp(0.0, 1.0);
                  }
                  return Container(
                      color: page.decoration.pageColor,
                      decoration: page.decoration.boxDecoration,
                      padding: page.decoration.contentPadding,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Transform(
                                transform: Matrix4.translationValues(
                                    0, -55.0 * (1 - y), 0),
                                child: page.image),
                            Container(
                                child: Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: page.decoration.titlePadding,
                                      child: _buildWidget(
                                        page.titleWidget,
                                        page.title,
                                        page.decoration.titleTextStyle,
                                      )))
                            ])),
                            Padding(
                                padding: page.decoration.descriptionPadding,
                                child: Transform(
                                  transform: Matrix4.translationValues(
                                      0, 50.0 * (1 - y), 0),
                                  child: _buildWidget(page.bodyWidget,
                                      page.body, page.decoration.bodyTextStyle),
                                ))
                          ]));
                });
          }),
      widget.onboardingDecoration != null
          ? Align(
              alignment: widget.onboardingDecoration.aling,
              child: widget.onboardingDecoration.child,
            )
          : Container(),
      Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 50.0, left: 16),
            child: widget.skip == null
                ? SkipButton(
                    onPressed: widget.onSkip,
                    child: Text("Skip"),
                  )
                : widget.skip,
          )),
      Positioned(
        left: 30.0,
        bottom: 55.0,
        child: Container(
          width: 160.0,
          child: Dots(_currentPage, widget.pages.length, widget.dotsType, widget.indicatorDecoration),
        )
      ),
      Positioned(
          right: 30.0,
          bottom: 30.0,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: _lastPage ? _buildDone() : Container(),
          ))
    ]));
  }

  Widget _buildDone() {
    if (widget.done == null) {
      return NextButton(
        child: Icon(Icons.arrow_forward, color: Colors.white),
        onPressed: widget.onDone,
      );
    } else {
      return widget.done;
    }
  }
}

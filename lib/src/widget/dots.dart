import 'package:flutter/material.dart';

import '../../onboarding_anim.dart';

class Dots extends StatelessWidget {
  final int _currentIndex;
  final int _pageCount;
  final int _dots;
  final IndicatorDecoration _indicatorDecoration;

  Dots(this._currentIndex, this._pageCount, this._dots,
      this._indicatorDecoration);

  _indicator(bool isActive) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
                height: isActive ? 7 : 3.5,
                decoration: BoxDecoration(
                    color: isActive
                        ? _indicatorDecoration.active
                        : _indicatorDecoration.inactive,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: _indicatorDecoration.shadow,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 2.0)
                    ]))));
  }

  _dots2(isActive) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
            height: 9,
            width: isActive ? 25 : 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive
                  ? _indicatorDecoration.active
                  : _indicatorDecoration.inactive,
            )));
  }

  _dots3(isActive) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
            height: isActive ? 15 : 10,
            width: isActive ? 15 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive
                  ? _indicatorDecoration.active
                  : _indicatorDecoration.inactive,
            )));
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < _pageCount; i++) {
      if (_dots == 0)
        indicatorList.add(_indicator(i == _currentIndex));
      else if (_dots == 2) {
        indicatorList.add(_dots2(i == _currentIndex));
      } else {
        indicatorList.add(_dots3(i == _currentIndex));
      }
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    switch (_dots) {
      case 0:
        return Row(children: _buildPageIndicators());
      case 1:
        return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: LinearProgressIndicator(
                backgroundColor: _indicatorDecoration.inactive,
                valueColor:
                    AlwaysStoppedAnimation<Color>(_indicatorDecoration.active),
                value: (1 / _pageCount) * (_currentIndex + 1)));
      case 2:
        return Row(children: _buildPageIndicators());
      case 3:
        return Row(children: _buildPageIndicators());
      default:
        return Row(children: _buildPageIndicators());
    }
  }
}

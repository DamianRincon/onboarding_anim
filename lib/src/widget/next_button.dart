import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const NextButton({Key key, this.onPressed, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: child,
        onPressed: onPressed);
  }
}

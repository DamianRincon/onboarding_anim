import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const SkipButton({Key key, this.onPressed, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      textColor: Theme.of(context).primaryColor,
      splashColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
           width: 1.0,style: BorderStyle.solid
        )
      )
    );
  }
}
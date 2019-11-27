import 'package:flutter/material.dart';

class IndicatorDecoration {
  /// Active color
  final Color active;

  /// Inactive color
  final Color inactive;

  /// Shadow color
  final Color shadow;

  const IndicatorDecoration(
      {this.active = Colors.red,
      this.inactive = Colors.redAccent,
      this.shadow = Colors.blueGrey});
}

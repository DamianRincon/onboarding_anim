library onboarding_anim;

import 'package:flutter/material.dart';

class PageDecoration {
  /// Background page color
  final Color pageColor;
  /// TextStyle for title
  ///
  /// @Default style `fontSize: 20.0, fontWeight: FontWeight.bold`
  final TextStyle titleTextStyle;
  /// TextStyle for title
  ///
  /// @Default style `fontSize: 18.0, fontWeight: FontWeight.normal`
  final TextStyle bodyTextStyle;
  /// @Default `EdgeInsets.all(16.0)`
  final EdgeInsets contentPadding;
   /// Padding of title
  ///
  /// @Default `EdgeInsets.only(bottom: 24.0)`
  final EdgeInsets titlePadding;
  /// Padding of description
  ///
  /// @Default: `EdgeInsets.zero`
  final EdgeInsets descriptionPadding;
  /// Padding of image
  ///
  /// @Default `EdgeInsets.only(bottom: 24.0)`
  final EdgeInsets imagePadding;
  /// BoxDecoration for page
  final BoxDecoration boxDecoration;

  const PageDecoration({
    this.pageColor = Colors.white,
    this.boxDecoration,
    this.titleTextStyle = const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ),
    this.bodyTextStyle = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
    this.imagePadding = const EdgeInsets.only(bottom: 25.0),
    this.contentPadding = const EdgeInsets.all(16.0),
    this.titlePadding = const EdgeInsets.only(bottom: 25.0),
    this.descriptionPadding = EdgeInsets.zero,
  }) : 
  assert(
    pageColor == null || boxDecoration == null,
    'Cannot provide both a Color and a BoxDecoration\n'
  );
}
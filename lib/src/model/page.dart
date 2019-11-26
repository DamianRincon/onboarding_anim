import 'package:flutter/material.dart';
import 'package:onboarding_anim/src/model/page_decoration.dart';

class PageModel{
  /// Title of page used String
  final String title;
  /// Title of page used Widget
  final Widget titleWidget;
  /// Body of page used String (description)
  final String body;
  /// Body of page used Widget (description)
  final Widget bodyWidget;
  /// Image of page
  final Widget image;
  /// Page decoration
  /// Contain all page customizations, like page color, text styles
  final PageDecoration decoration;

  PageModel({
    this.title,
    this.titleWidget,
    this.body,
    this.bodyWidget,
    this.image,
    this.decoration = const PageDecoration(),
  }) : 
  assert(
    title != null || titleWidget != null,
    "You must provide either title (String) or titleWidget (Widget).",
  ),
  assert(
    (title == null) != (titleWidget == null),
    "You can not provide both title and titleWidget.",
  ),
  assert(
    body != null || bodyWidget != null,
    "You must provide either body (String) or bodyWidget (Widget).",
  ),
  assert(
    (body == null) != (bodyWidget == null),
    "You can not provide both body and bodyWidget.",
  );
}
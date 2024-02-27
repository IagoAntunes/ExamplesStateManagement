import 'package:flutter/material.dart';

class PageModel {
  final Widget Function() builder;
  String title;
  PageModel({
    required this.builder,
    required this.title,
  });
}

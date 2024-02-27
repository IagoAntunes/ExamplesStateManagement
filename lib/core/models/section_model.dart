import 'package:flutter/material.dart';
import 'package:testando_coisas/core/models/group_page_mode.dart';

class SectionModel {
  String title;
  List<GroupPageModel> list;
  final Widget Function() builder;
  SectionModel({
    required this.title,
    required this.builder,
    required this.list,
  });
}

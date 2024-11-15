import 'package:flutter/material.dart';

class AnswerItemModel {
  final String title;
  final VoidCallback onPressed;

  AnswerItemModel({
    required this.title,
    required this.onPressed,
  });
}

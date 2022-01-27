import 'package:flutter/material.dart';
import 'dart:ui';

BuildIconWidget({
  sw,
  sh,
  required  icon,
  Color color = Colors.white,
  size,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: sh, horizontal: sw),
    child: Icon(
      icon,
      color: color,
      size: size,
    ),
  );
}

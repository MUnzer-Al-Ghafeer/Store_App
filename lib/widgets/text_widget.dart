import 'package:flutter/material.dart';
import 'dart:ui';

BuildTextWidget({
  sw,
  sh,
  color=Colors.white,
  size,
  required String txt,
  FontWeight = 0,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: sw, vertical: sh),
    child: Text(txt,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        letterSpacing: 2,
        color: color,
        fontSize: size,
        fontWeight: FontWeight,

      ),
    ),
  );
}
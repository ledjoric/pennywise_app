import 'package:flutter/material.dart';

// const double fieldWidth = 350;
const double fieldHeight = 50;

const double fontSize = 18;
const double headerFont = 32;

const double bRadius = 40;

const double iconSize = 65;

extension MediaQueryValues on BuildContext {
  double get fieldWidth => MediaQuery.of(this).size.width * .85;
}

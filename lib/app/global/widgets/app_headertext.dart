import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';

class AppHeaderText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AppHeaderText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: style ?? kRegHeaderStyle,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';

class AppRegularText extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final String text;
  final TextStyle? style;
  final TextAlign? align;

  const AppRegularText({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
    this.style,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? kRegTextStyle,
        textAlign: align ?? TextAlign.center,
      ),
    );
  }
}

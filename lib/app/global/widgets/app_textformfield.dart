import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

import '../constants/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool? obscureText;

  const AppTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight,
      width: double.maxFinite,
      child: TextFormField(
        style: kRegTextStyle,
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: kFieldBorder,
          border: kFieldBorder,
          focusedBorder: kFieldBorder,
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: kFieldStyle,
          fillColor: greyLight,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

import '../constants/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?) validator;
  final bool isLimited;

  const AppTextFormField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscureText,
    required this.validator,
    required this.isLimited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight,
      width: double.maxFinite,
      child: TextFormField(
        keyboardType: isLimited ? TextInputType.number : null,
        maxLength: isLimited ? 10 : null,
        validator: validator,
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

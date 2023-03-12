import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

import '../constants/styles.dart';

class AppTextFormField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const AppTextFormField({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight,
      width: fieldWidth,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: kFieldBorder,
          border: kFieldBorder,
          focusedBorder: kFieldBorder,
          prefixIcon: Icon(icon),
          label: Text(label),
          labelStyle: kFieldStyle,
          fillColor: greyLight,
        ),
      ),
    );
  }
}

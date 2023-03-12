import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

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
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: transparent,
            ),
            borderRadius: BorderRadius.circular(
              40,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: transparent,
            ),
            borderRadius: BorderRadius.circular(
              40,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: transparent,
            ),
            borderRadius: BorderRadius.circular(
              40,
            ),
          ),
          prefixIcon: Icon(icon),
          label: Text(label),
          labelStyle: const TextStyle(fontSize: fontSize),
          fillColor: greyLight,
        ),
      ),
    );
  }
}

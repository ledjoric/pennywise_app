import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';
import 'package:pennywise_app/app/global/constants/fonts.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pinput/pinput.dart';

class PInput extends StatelessWidget {
  final TextEditingController controller;
  const PInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 55,
      child: Pinput(
        controller: controller,
        length: 6,
        defaultPinTheme: PinTheme(
          width: double.maxFinite,
          textStyle: kRegHeaderStyle,
          decoration: BoxDecoration(
            color: greyLight,
            borderRadius: BorderRadius.circular(80),
          ),
        ),
      ),
    );
  }
}

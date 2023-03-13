import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';
import 'package:pennywise_app/app/global/constants/fonts.dart';
import 'package:pennywise_app/app/global/constants/styles.dart';
import 'package:pinput/pinput.dart';

class PInput extends StatelessWidget {
  const PInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 55,
      child: Pinput(
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

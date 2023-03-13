import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';

class RedBox extends StatelessWidget {
  const RedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 14,
      decoration: BoxDecoration(
        color: tertiaryColor,
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}

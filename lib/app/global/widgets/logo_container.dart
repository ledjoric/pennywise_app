import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

import '../constants/styles.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: kIconBox,
    );
  }
}

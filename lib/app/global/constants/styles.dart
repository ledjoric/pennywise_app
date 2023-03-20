import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';
import 'fonts.dart';

const kFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(color: transparent),
  borderRadius: kRadius,
);

const BorderRadius kRadius = BorderRadius.all(
  Radius.circular(bRadius),
);

const BorderRadius kBottomSheetRadius = BorderRadius.only(
  topLeft: Radius.circular(bRadius),
  topRight: Radius.circular(bRadius),
);

const kFieldStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: mediumFont,
);

const kButtonStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: boldFont,
  color: primaryColor,
);

const kButtonStyle2 = TextStyle(
  fontSize: fontSize,
  fontFamily: boldFont,
  color: secondaryColor,
);

const kRegTextStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: boldFont,
  color: greyDark,
);

const kBoldTextStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: extraBoldFont,
  color: greyDark,
);

const kRegHeaderStyle = TextStyle(
  fontSize: headerFont,
  color: secondaryColor,
  fontFamily: boldFont,
  letterSpacing: 0.005,
);

const kBalanceStyle = TextStyle(
  fontSize: balanceFont,
  color: secondaryColor,
  fontFamily: extraBoldFont,
);

const kBoldHeaderStyle = TextStyle(
  fontSize: headerFont,
  color: secondaryColor,
  fontFamily: heavyFont,
  fontWeight: FontWeight.bold,
);

const kIconBox = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "assets/images/logo.png",
    ),
  ),
);

const kOutlinedButton = BorderSide(
  width: 2.25,
  color: secondaryColor,
  style: BorderStyle.solid,
);

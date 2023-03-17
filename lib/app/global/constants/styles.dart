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
  fontFamily: appFont,
);

const kButtonStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: appFont,
  color: primaryColor,
  fontWeight: FontWeight.bold,
);

const kButtonStyle2 = TextStyle(
  fontSize: fontSize,
  fontFamily: appFont,
  color: secondaryColor,
  fontWeight: FontWeight.bold,
);

const kRegTextStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: appFont,
  color: greyDark,
);

const kBoldTextStyle = TextStyle(
  fontSize: fontSize,
  fontFamily: appFont,
  color: greyDark,
  fontWeight: FontWeight.bold,
);

const kRegHeaderStyle = TextStyle(
  fontSize: headerFont,
  color: secondaryColor,
  fontFamily: appFont,
);

const kBalanceStyle = TextStyle(
  fontSize: balanceFont,
  color: secondaryColor,
  fontFamily: appFont,
  fontWeight: FontWeight.bold,
);

const kBoldHeaderStyle = TextStyle(
  fontSize: headerFont,
  color: secondaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: appFont,
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

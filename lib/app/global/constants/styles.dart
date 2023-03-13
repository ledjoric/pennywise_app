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
  fontSize: 26,
  color: secondaryColor,
  fontFamily: appFont,
);

const kBoldHeaderStyle = TextStyle(
  fontSize: 26,
  color: secondaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: appFont,
);

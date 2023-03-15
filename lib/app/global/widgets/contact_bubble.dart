import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/app_regulartext.dart';

class ContactBubble extends StatelessWidget {
  final Color color;

  const ContactBubble({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //separate circleavatar. make reusable
        CircleAvatar(
          backgroundColor: color,
          radius: 32,
        ),
        const AppRegularText(
          text: 'John',
          color: greyDark,
        ),
      ],
    );
  }
}

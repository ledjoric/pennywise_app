import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pennywise_app/app/global/constants/colors.dart';
import 'package:pennywise_app/app/global/widgets/contact_bubble.dart';

class QuickContacts extends StatelessWidget {
  const QuickContacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactBubble(
          color: tertiaryColor,
        ),
        ContactBubble(
          color: tertiaryColor,
        ),
        ContactBubble(
          color: tertiaryColor,
        ),
      ],
    );
  }
}

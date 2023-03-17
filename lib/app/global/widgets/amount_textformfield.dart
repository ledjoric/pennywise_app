import 'package:flutter/material.dart';
import 'package:pennywise_app/app/global/constants/dimensions.dart';

import '../constants/styles.dart';

class AmountTextFormField extends StatelessWidget {
  final TextEditingController controller;
  // final String? Function(String?)? validator;
  const AmountTextFormField({
    Key? key,
    required this.controller,
    // required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight,
      child: TextFormField(
        // validator: validator,
        controller: controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        keyboardType: TextInputType.number,
        style: kBoldHeaderStyle,
        decoration: const InputDecoration(
          prefixIcon: Text(
            '\$',
            style: kBoldHeaderStyle,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: '0.00',
          contentPadding: EdgeInsets.only(
            bottom: 12,
          ),
        ),
      ),
    );
  }
}

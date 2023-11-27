import 'package:flutter/material.dart';

import '../const/theme_data/my_text_style.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.nameController,
    required this.title,
    required this.validator,
    required this.type,
    required this.borderRadius,
  });

  final TextEditingController nameController;
  final String title;
  final double borderRadius;
  final dynamic validator;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
          labelText: title,labelStyle: MyTextStyle.txtTextStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius))),
      validator: validator,
      keyboardType: type,
    );
  }
}
import 'package:flutter/material.dart';

class NewTxt extends StatelessWidget {
  final String header;
  final String value;
  final double wt;

  const NewTxt(
      {super.key, required this.header, required this.value, required this.wt});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$header : ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: wt,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
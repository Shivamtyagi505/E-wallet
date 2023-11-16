import 'package:flutter/material.dart';

Widget customIcon({IconData? icon, Color? color, Color? borderColor, String? text}) {
  return Column(children: [
    Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color, border: Border.all(color: borderColor ?? Colors.grey)),
        padding: const EdgeInsets.all(20),
        child: Icon(icon)),
    const SizedBox(height: 10),
    Text(text ?? '')
  ]);
}

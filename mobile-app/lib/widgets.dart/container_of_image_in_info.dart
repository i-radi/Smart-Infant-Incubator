import '../style/color.dart';
import 'package:flutter/material.dart';

Widget buildContainerOfImage(BuildContext context, Widget child) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: iconOfAdminClr),
          borderRadius: BorderRadius.circular(34),
        ),
        child: child),
  );
}

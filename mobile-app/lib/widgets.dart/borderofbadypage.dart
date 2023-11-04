import 'package:flutter/material.dart';

Widget borderOfBabyPage(
    BuildContext ctx, Widget call, Color clrOfBorder, Color bageClr) {
  return Padding(
    padding:
        EdgeInsets.fromLTRB(8, MediaQuery.of(ctx).size.height * 0.17, 8, 0),
    child: Container(
      width: (MediaQuery.of(ctx)).size.width * 0.95,
      height: (MediaQuery.of(ctx)).size.height * 0.9,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        border: Border(
          top: BorderSide(color: clrOfBorder),
          left: BorderSide(color: clrOfBorder),
          right: BorderSide(color: clrOfBorder),
          bottom: BorderSide(color: clrOfBorder),
        ),
        color: bageClr,
      ),
      child: call,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

Widget textOfDeleteDialog(String text) {
  return Center(
    child: Text(
      text,
      textScaleFactor: 1,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buttonsOfDeleteDialog(
    Color clrButton, String textData, Function() func) {
  return TextButton(
      onPressed: func,
      child: Container(
        height: 32.h,
        width: 104.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: clrButton,
        ),
        child: Center(
          child: Text(
            textData,
            textScaleFactor: 1,
            style: TextStyle(fontSize: 18.sp, color: white),
          ),
        ),
      ));
}

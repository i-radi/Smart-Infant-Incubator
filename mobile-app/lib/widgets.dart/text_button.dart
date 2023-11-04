import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class TextButtonInLogin extends StatelessWidget {
  const TextButtonInLogin(
      {required this.onPressed, required this.title, Key? key})
      : super(key: key);
  final Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        textScaleFactor: 1.2,
        style: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w900, color: edtButtonClr),
      ),
    );
  }
}

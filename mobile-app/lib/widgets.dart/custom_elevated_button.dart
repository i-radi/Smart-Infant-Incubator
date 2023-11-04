import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButton({
    this.height,
    this.width,
    required this.child,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        child: child,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: shape,
          elevation: elevation,
          primary: buttonColor,
          onPrimary: splashColor,
          shadowColor: shadowColor,
          padding: padding ??
              EdgeInsets.zero, //Not necessary if you added height and width.
        ),
      ),
    );
  }
}

class WideCustomElevatedButtonInSignUp extends StatelessWidget {
  const WideCustomElevatedButtonInSignUp(
      {required this.onPressed,
      required this.title,
      this.titleClr,
      this.buttonClr,
      Key? key})
      : super(key: key);

  final Function() onPressed;
  final String title;
  final Color? titleClr;
  final Color? buttonClr;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 47.h,
      width: double.infinity,
      child: Text(
        title,
        textScaleFactor: 1.2,
        style: TextStyle(fontSize: 19.sp, color: titleClr ?? white),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 6,
      buttonColor: buttonClr ?? wideButtonClr,
      splashColor: iconOfAdminClr,
    );
  }
}

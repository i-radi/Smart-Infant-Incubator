import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildUpperPart extends StatelessWidget {
  const BuildUpperPart(
      {required this.backGroundImage,
      required this.firstText,
      required this.secondText,
      required this.clrOfSecondText,
      this.thirdText,
      this.clrOfThirdText,
      this.functionOfTextButton,
      Key? key})
      : super(key: key);

  final String backGroundImage;
  final String firstText;
  final String secondText;
  final Color clrOfSecondText;
  final String? thirdText;
  final Color? clrOfThirdText;
  final Function()? functionOfTextButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.w),
          child: CircleAvatar(
            backgroundImage: AssetImage(backGroundImage),
            backgroundColor: white,
            radius: 60.r,
          ),
        ),
        Text(
          firstText,
          textScaleFactor: 1.2,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900),
        ),
        Text(
          secondText,
          textScaleFactor: 1.2,
          style: TextStyle(
              color: clrOfSecondText,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        if ((thirdText != null) &&
            (functionOfTextButton != null) &&
            (clrOfThirdText != null))
          TextButton(
            onPressed: functionOfTextButton,
            child: Text(
              thirdText!,
              textScaleFactor: 1.2,
              style: TextStyle(color: clrOfThirdText),
            ),
          ),
      ],
    );
  }
}
//upper part for mother

class UpperPartInMother extends StatelessWidget {
  const UpperPartInMother(
      {required this.circuleOfImageWithButton,
      required this.firstText,
      required this.secondText,
      required this.clrOfSecondText,
      this.thirdText,
      this.clrOfThirdText,
      this.functionOfTextButton,
      Key? key})
      : super(key: key);

  final Widget circuleOfImageWithButton;
  final String firstText;
  final String secondText;
  final Color clrOfSecondText;
  final String? thirdText;
  final Color? clrOfThirdText;
  final Function()? functionOfTextButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: circuleOfImageWithButton,
        ),
        Text(
          firstText,
          textScaleFactor: 1.2,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w900),
        ),
        Text(
          secondText,
          textScaleFactor: 1.2,
          style: TextStyle(
              color: clrOfSecondText,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600),
        ),
        if ((thirdText != null) &&
            (functionOfTextButton != null) &&
            (clrOfThirdText != null))
          TextButton(
            onPressed: functionOfTextButton,
            child: Text(
              thirdText!,
              style: TextStyle(color: clrOfThirdText),
            ),
          ),
      ],
    );
  }
}

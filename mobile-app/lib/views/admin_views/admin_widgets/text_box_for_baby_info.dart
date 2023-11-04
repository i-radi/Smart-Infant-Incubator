import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/color.dart';

Widget textFormInBabyInformationScreen(String title, IconData? callIcon) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: Container(
        width: 177.w,
        height: 41.h,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: iconOfAdminClr),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: TextFormField(
                  enabled: true,
                  initialValue: title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      callIcon,
                      color: iconOfAdminClr,
                    ),
                    hintMaxLines: 2,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              )),
        )),
  );
}

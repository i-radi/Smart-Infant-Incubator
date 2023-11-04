import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget percentageCircule(String textState, val, val1, Color clr) {
  return Column(
    children: [
      SizedBox(
        height: 10.h,
      ),
      Row(children: [
        CircularPercentIndicator(
          radius: 40.r,
          lineWidth: 5,
          percent: val,
          backgroundColor: white.withOpacity(0.97),
          progressColor: clr,
        ),
        SizedBox(
          width: 25.w,
        ),
        Text(
          '$val1%',
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(
          textState,
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      SizedBox(
        height: 10.h,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width: 190.w,
          height: 0.2.h,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100], boxShadow: const [BoxShadow()]),
          ),
        ),
      )
    ],
  );
}

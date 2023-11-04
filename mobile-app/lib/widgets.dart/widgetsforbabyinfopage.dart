import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';

Widget iconSvgBuild(String inc, Color clr) {
  return SvgPicture.asset(
    inc,
    width: 20.0,
    height: 20.0,
    allowDrawingOutsideViewBox: true,
    color: clr,
  );
}

Widget textData(String title) {
  return Column(children: <Widget>[
    Text(
      title,
      textScaleFactor: 1,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),
      textAlign: TextAlign.left,
    ),
    SizedBox(
      height: 13.h,
    ),
  ]);
}

dividerBuild(Color clr) {
  return Column(
    children: [
      Container(
          color: clr,
          child: SizedBox(
            height: 0.5,
            width: 160.w,
          )),
    ],
  );
}

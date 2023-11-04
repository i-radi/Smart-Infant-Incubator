import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';
import 'widgetsforbabyinfopage.dart';

Widget widgetsOfFloatingCallCirculeButton(
    BuildContext context, Color borderClr, String txt, Widget routePage) {
  return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        routePage;
        showDialog(
            context: context,
            builder: (ctx) {
              return routePage;
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 100.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: white,
              border: Border.all(color: borderClr),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: shadowClr,
                    offset: Offset(0, 3),
                    blurRadius: 2,
                    spreadRadius: 0.5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconSvgBuild('assets/image/call.svg', borderClr),
              Text(
                txt,
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ));
}

import 'package:final_project/style/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildUnReadContainerOfNotifications(BuildContext ctx, String title,
    String txt, Color borderClr, Color pageClr, Function() fun, Color txtClr) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(5.5.h),
        child: InkWell(
          onTap: fun,
          child: Container(
            padding: EdgeInsets.only(left: 14.w),

            //make height of the container is responsive
            height: MediaQuery.of(ctx).size.height * 0.14,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: borderClr),
                borderRadius: BorderRadius.circular(26),
                color: pageClr,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.16),
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '●',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      color: txtClr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  title,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: txtClr,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  txt,
                  textScaleFactor: 1.15,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildReadContainerOfNotifications(BuildContext ctx, String title,
    String txt, Color borderClr, Color pageClr, Function() fun) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(5.5.h),
        child: InkWell(
          onTap: fun,
          child: Container(
            padding: EdgeInsets.only(left: 14.w),

            //make height of the container is responsive
            height: MediaQuery.of(ctx).size.height * 0.14,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: borderClr),
              borderRadius: BorderRadius.circular(26),
              color: pageClr,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  title,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: edtButtonClr,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  txt,
                  textScaleFactor: 1.15,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

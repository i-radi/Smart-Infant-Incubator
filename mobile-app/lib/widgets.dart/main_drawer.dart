import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMainDrawer(
    BuildContext ctx,
    Color drawerClr,
    Color borderOfDrawerClr,
    Color textClr,
    ImageProvider img,
    String txt,
    Function() fun,
    Widget drawerDetails,
    Widget babyImage) {
  return SafeArea(
    child: Container(
      height: (MediaQuery.of(ctx).size.height),
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r),
        ),
        border: Border.all(color: borderOfDrawerClr, width: 1),
        boxShadow: [
          BoxShadow(
            color: drawerClr,
            // spreadRadius: 0.0005,
            blurRadius: 6,
            offset: const Offset(3, 0),
          )
        ],
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 35.h)),
          InkWell(
            onTap: fun,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: img,
                  radius: 21.r,
                ),
                Text(
                  txt,
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 13.sp,
                      //fontWeight: FontWeight.w700,
                      color: textClr),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(ctx).size.height * 0.02,
          ),
          drawerDetails,
          //SizedBox(height: MediaQuery.of(ctx).size.height * 0.015),
          babyImage
        ],
      ),
    ),
  );
}

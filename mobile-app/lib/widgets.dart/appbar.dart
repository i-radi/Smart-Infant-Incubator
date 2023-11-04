import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../style/color.dart';

AppBar buildAppBar({
  String appBarTxt = '',
  String leadingSvgiconInAppBar = '',
  Color leadingColor = black,
  double? sizeOfLeadinIcon = 18.0,
  required Function() fun,
  required Color drawerClr,
}) {
  return AppBar(
    title: Text(
      appBarTxt,
      textScaleFactor: 1.2,
      style: TextStyle(color: black, fontSize: 18.sp),
    ),
    backgroundColor: Colors.white.withOpacity(0),
    elevation: 0,
    iconTheme: IconThemeData(color: drawerClr, size: 35),
    leading: IconButton(
      onPressed: fun,
      icon: SvgPicture.asset(
        leadingSvgiconInAppBar,
        height: sizeOfLeadinIcon,
        color: leadingColor,
      ),
    ),
  );
}

AppBar appBarForAuth({
   String actionImg = '',
  required final String leadingImg,
  required final Function() onPressed,
}) {
  return AppBar(
    backgroundColor: Colors.white.withOpacity(0),
    elevation: 0,

    leading: IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        leadingImg,
        height: 18.0,
      ),
    ),
    actions: [
      if(actionImg.isNotEmpty)
      SvgPicture.asset(
        actionImg,
        height: 60.h,
      )
    ],
    // iconTheme: const IconThemeData(size: 35),
  );
}

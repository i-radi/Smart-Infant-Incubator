import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'searchbarbuild.dart';

AppBar appBarWithSearchBox(BuildContext context, Color iconClr,
    Color boxSearchClr, String hintTxt, Function() func) {
  return AppBar(
      leadingWidth: 45.w,
      elevation: 0,
      iconTheme: IconThemeData(color: iconClr, size: 32),
      backgroundColor: Colors.white.withOpacity(0),
      foregroundColor: iconClr,
      title: Padding(
        padding: EdgeInsets.only(top: 13.0.h, bottom: 8.0.h),
        child: Container(
          height: 42.h,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: boxSearchClr, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            showCursor: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                color: boxSearchClr,
              ),
              hintText: hintTxt,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: const Color.fromRGBO(143, 172, 196, 1),
              ),
            ),
            keyboardType: TextInputType.name,
            textAlign: TextAlign.start,
            onTap: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          onPressed: func,
          icon: iconSvgBuild('assets/image/backarrow.svg', black),
        ),
      ));
}

import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../admin_views/admin_widgets/text_box_for_baby_info.dart';

Widget editDetails() {
  return Column(
    children: <Widget>[
      editRow('Baby code', '1234', null),
      editRow(
        'Gender',
        'female',
        Icons.keyboard_arrow_down_rounded,
      ),
      editRow(
        'Doctor',
        'Dr-Name 1',
        Icons.keyboard_arrow_down_rounded,
      ),
      editRow(
        'Nurse',
        'Nurse name1',
        Icons.keyboard_arrow_down_rounded,
      ),
      editRow('Mother user name', 'Mother user name', null),
      editRow('Mother Number', '••••••••••', null),
      editRow('Password', '•••••••', null),
      editRow('Birth date', '5/12/2021', null),
    ],
  );
}

editRow(String title, String data, icn) {
  return Row(
    children: [
      SizedBox(
          width: 130.w,
          height: 35,
          child: textWithoutPadding(title, FontWeight.bold)),
      textFormInBabyInformationScreen(data, icn),
    ],
  );
}

textWithoutPadding(String title, FontWeight weight) {
  return Text(
    title,
    textScaleFactor: 1,
    style: TextStyle(color: Colors.black, fontWeight: weight, fontSize: 14.sp),
    textAlign: TextAlign.left,
  );
}

saveRow(String title, String data, Widget? icn) {
  return Row(
    children: [
      SizedBox(
        width: 130.w,
        child: textWithoutPadding(title, FontWeight.normal),
      ),
      SizedBox(
        width: 178.w,
        child: textWithoutPadding(data, FontWeight.bold),
      ),
      Container(
        child: icn,
      )
    ],
  );
}

saveDetails() {
  return SizedBox(
    width: 330.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        saveRow('Baby code', '1234', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Gender', 'female', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Doctor', 'Dr-name 1', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Nurse', 'Nurse name 1', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Mother user name', 'Mother user name', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Mother number', '••••••••••',
            iconSvgBuild('assets/image/call.svg', iconOfAdminClr)),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Password', '•••••••', null),
        const Divider(
          color: borderOfAdminClr,
        ),
        SizedBox(
          height: 20.h,
        ),
        saveRow('Birth date', '5/12/2021', null),
      ],
    ),
  );
}

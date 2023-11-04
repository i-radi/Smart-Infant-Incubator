import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgetsforbabyinfopage.dart';

Widget nurseAndDoctorDetails(
    BuildContext context, String txt, String img, Color clr) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(img),
              backgroundColor: Colors.transparent,
            ),
            Text(
              txt,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                txtWithFont16('Phone Numper'),
                Text(
                  '•••••••••••',
                  textScaleFactor: 1,
                  style:
                      TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: iconSvgBuild('assets/image/call.svg', clr),
            )
          ],
        )
      ],
    ),
  );
}

Widget motherDetails(Color clr) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Mother Name',
          textScaleFactor: 1,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                txtWithFont16('Phone Numper'),
                Text(
                  '•••••••••••',
                  textScaleFactor: 1,
                  style:
                      TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: iconSvgBuild('assets/image/call.svg', clr),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                txtWithFont16('Baby Code'),
                Container(
                  width: 80,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(color: clr),
                      borderRadius: BorderRadius.circular(11)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '••••',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 27.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget txtWithFont16(String txt) {
  return Text(
    txt,
    textScaleFactor: 1,
    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  );
}

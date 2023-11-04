import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

Widget cardList(BuildContext context, String imageBaby, String babyCode,
    String babyDate, Widget? crc) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    height: MediaQuery.of(context).size.height * 0.2,
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
          BoxShadow(color: shadowClr, offset: Offset(0, 2), blurRadius: 3)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: Image.asset(
              imageBaby,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              babyCode,
              textScaleFactor: 1.2,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Bahnschrift'),
            ),
            Text(babyDate,
                textScaleFactor: 1.2,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Bahnschrift')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 13, bottom: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Container(child: crc)],
          ),
        )
      ],
    ),
  );
}

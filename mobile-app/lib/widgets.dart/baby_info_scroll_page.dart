import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets.dart/widgetsforbabyinfopage.dart';
import 'cryanalysiscontainerbabypage.dart';

Widget babyscreenScrollPage(
    BuildContext ctx, Color borderClr, icnClr, Widget cryAnalysisRouteBage) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                rowBuild(
                    'Baby code',
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    borderClr),
                rowBuild(
                    'Gender',
                    iconSvgBuild('assets/image/baby1.svg', Colors.black),
                    borderClr),
                rowBuild(
                    'Temprature',
                    iconSvgBuild('assets/image/temperature1.svg', Colors.black),
                    borderClr),
                rowBuild(
                    'Weight',
                    iconSvgBuild('assets/image/weight1.svg', Colors.black),
                    borderClr),
                rowBuild(
                    'Heart beat',
                    iconSvgBuild('assets/image/heart.svg', Colors.black),
                    borderClr),
                rowBuild(
                    'Humidity',
                    iconSvgBuild('assets/image/humidity1.svg', Colors.black),
                    borderClr),
              ],
            )
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            cryAnalysisContainer(ctx, borderClr, cryAnalysisRouteBage, icnClr)
          ],
        )
      ],
    ),
  );
}

rowBuild(String title, Widget? img, Color clr) {
  return Row(
    children: [
      SizedBox(
        width: 100,
        height: 60,
        child: Column(
          children: [
            Container(
              child: img,
            ),
            textData(title),
          ],
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: dividerBuild(clr),
      )
    ],
  );
}

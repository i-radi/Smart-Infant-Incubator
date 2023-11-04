import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';
import 'circulebutton.dart';
import 'widgetsforbabyinfopage.dart';

Widget cryAnalysisContainer(
    BuildContext context, Color borderClr, Widget callCryPage, Color iconclr) {
  return Container(
    width: (MediaQuery.of(context)).size.width * 0.67,
    height: (MediaQuery.of(context)).size.height * 0.18,
    decoration: BoxDecoration(
        border: Border.all(color: borderClr),
        borderRadius: BorderRadius.circular(25)),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cry Analysis',
            textScaleFactor: 1,
            style: TextStyle(
                color: edtButtonClr,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900),
          ),
          Text(
            'analysis voice to predict the reason',
            textScaleFactor: 1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                circuleButtonWithNavigator(
                  context,
                  callCryPage,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconSvgBuild('assets/image/cryvoice.svg', iconclr),
                    ],
                  ),
                  iconclr,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

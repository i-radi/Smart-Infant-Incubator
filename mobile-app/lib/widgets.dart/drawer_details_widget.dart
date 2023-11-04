import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildTextIconInDrawer(String svgPath, String title, BuildContext ctx,
    Function()? fun, Color textClr) {
  return Column(
    children: [
      InkWell(
        /*  onHover: (bool val) {
            if (val) {
              setState(() {
                white;
              });
            } else {
              setState(() {
                Colors.black;
              });
            }
          }, */
        onTap: fun,
        child: Column(
          children: [
            // Icon( icn, size: 25, ),
            SvgPicture.asset(
              svgPath,
              color: textClr,
              width: 15,
              height: 20,
            ),
            Text(
              title,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 15.sp, color: textClr),
            ),
          ],
        ),
      ),
      SizedBox(
        height: MediaQuery.of(ctx).size.height * 0.04,
      ),
    ],
  );
}

import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBorder(
    BuildContext ctx, Widget child, Color borderClr, Color pageClr) {
  return Padding(
    padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 4.h),
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.h),
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(ctx).size.height * 0.88),
        width: MediaQuery.of(ctx).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: borderClr.withOpacity(0.3), width: 1.0),
          borderRadius: BorderRadius.circular(26),
          color: pageClr,
          /* boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(3, 2)),
          ],*/
        ),
        child: child),
  );
}

class BorderOfAuth extends StatelessWidget {
  const BorderOfAuth({Key? key, required this.chiled}) : super(key: key);
  final Widget chiled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, bottom: 5.h),
      child: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.871),

        // height: (MediaQuery.of(context).size.height * 0.88),
        decoration: BoxDecoration(
          border:
              Border.all(color: borderOfAdminClr.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(26),
        ),
        child: chiled,
      ),
    );
  }
}

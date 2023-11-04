import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/color.dart';

Widget buildCirculerButtonInInformationPage(String icn, Function() onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.all(4),
      height: 60,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: iconOfAdminClr.withOpacity(0.5)),
        shape: BoxShape.circle,
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconSvgBuild(icn, iconOfAdminClr),
        ],
      ),
    ),
  );
}

class CirculerButtonInInfo extends StatelessWidget {
  const CirculerButtonInInfo(
      {required this.onPressed, required this.svgPath, Key? key})
      : super(key: key);

  final Function() onPressed;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(7),
        height: 60,
        decoration: BoxDecoration(
            border:
                Border.all(width: 0.5, color: iconOfAdminClr.withOpacity(0.5)),
            shape: BoxShape.circle,
            color: white,
            boxShadow: const [
              BoxShadow(
                color: shadowClr,
                offset: Offset(3, 3),
                blurRadius: 6,
              ),
            ]),
        child: SvgPicture.asset(
          svgPath,
          height: 30,
          // width: 20,
          color: iconOfAdminClr,
        ),
      ),
    );
  }
}

//small add button

class SmallCirculerButtonWithPositon extends StatelessWidget {
  const SmallCirculerButtonWithPositon(
      {required this.svgPath,
      required this.onPressed,
      required this.borderOfButtonClr,
      required this.iconClr,
      Key? key})
      : super(key: key);

  final String svgPath;
  final Function() onPressed;
  final Color borderOfButtonClr;
  final Color iconClr;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      // elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(4),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0.5, color: borderOfButtonClr),
        ),
        child: SvgPicture.asset(
          svgPath,
          height: 17,
          //  fit: BoxFit.scaleDown,

          color: iconClr,
        ),
      ),
    );
  }
}

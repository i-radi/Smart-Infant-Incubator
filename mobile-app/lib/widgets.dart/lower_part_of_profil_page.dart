import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildLowerPart extends StatelessWidget {
  const BuildLowerPart({
    Key? key,
    required this.text,
    required this.widget,
    this.icon,
    this.colorOfIcon,
  }) : super(key: key);

  final String text;
  final Widget widget;
  final String? icon;
  final Color? colorOfIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  textScaleFactor: 1.1,
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 5.h,
                ),
                widget,
              ],
            ),
            if ((icon != null) && (colorOfIcon != null))
              SvgPicture.asset(
                icon!,
                height: 18.h,
                color: colorOfIcon,
              )
          ],
        ),
      ],
    );
  }
}

class TxtWidget extends StatelessWidget {
  const TxtWidget({required this.textt, Key? key}) : super(key: key);
  final String textt;
  @override
  Widget build(BuildContext context) {
    return Text(
      textt,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
    );
  }
}

class BuildContainerOfBabyCode extends StatelessWidget {
  const BuildContainerOfBabyCode(
      {required this.text, required this.borserClr, Key? key})
      : super(key: key);

  final String text;
  final Color borserClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 75.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.8,
          color: borserClr.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}




/*


Widget buildLowerPart(
    String txt, Widget widget, IconData? icn, Color? iconColor) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txt,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 5,
              ),
              widget,
            ],
          ),
          Icon(
            icn,
            size: 30,
            color: iconColor,
          ),
        ],
      ),
      const Divider(
        thickness: 1,
      ),
    ],
  );
}


*/


/*
Widget textSt(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );
}
*/



/*

Widget containerOfBabyCode(String txt, Color borderClr) {
  return Container(
    height: 35,
    width: 75,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1.8,
        color: borderClr.withOpacity(0.5),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
          child: Text(
        txt,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )),
    ),
  );
}
*/
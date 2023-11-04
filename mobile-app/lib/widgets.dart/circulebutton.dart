import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';

import 'deletedialog.dart';

Widget circuleButtonWithNavigator(
    BuildContext context, Widget routePage, Widget svgIcn, Color borderClr) {
  return InkWell(
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => routePage),
      );
    },
    child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0.5, color: borderClr),
        ),
        child: svgIcn),
  );
}

Widget circuleButtonWithDialog(
    Widget delete, BuildContext context, Widget svgIcn, Color borderClr) {
  return InkWell(
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: () {
      deleteDialog;
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return delete;
          });
    },
    child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0.5, color: borderClr),
        ),
        child: svgIcn),
  );
}

class CircleButtonForImageInImptyIncubator extends StatelessWidget {
  const CircleButtonForImageInImptyIncubator(
      {required this.svgPath, required this.func, Key? key})
      : super(key: key);
  final String svgPath;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: func,
      child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 0.5, color: iconOfAdminClr),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconSvgBuild(svgPath, iconOfAdminClr),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

import '../style/color.dart';
import 'deletedialog.dart';
import 'widgetsforbabyinfopage.dart';

Widget addAndDeletButton(BuildContext context, Widget delete, Function() func) {
  return Container(
      height: 88,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: drawerOfAdminClr, width: 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: func,
                child: iconSvgBuild('assets/image/add1.svg', iconOfAdminClr),
              ),
            ],
          ),
          const Divider(
            height: 0.5,
            color: borderOfAdminClr,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  deleteDialog;
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return delete;
                      });
                },
                child: iconSvgBuild('assets/image/delete1.svg', iconOfAdminClr),
              ),
            ],
          ),
        ],
      ));
}

Widget addAndDeletButtonForEmptyIncubator(
    BuildContext context, Widget delete, Widget func, details) {
  return Container(
      height: 88,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: drawerOfAdminClr, width: 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  dialogForAddEmPtyIncubator(context, details);
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return delete;
                      });
                },
                child: iconSvgBuild('assets/image/add1.svg', iconOfAdminClr),
              ),
            ],
          ),
          const Divider(
            height: 0.5,
            color: borderOfAdminClr,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  deleteDialog;
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return delete;
                      });
                },
                child: iconSvgBuild('assets/image/delete1.svg', iconOfAdminClr),
              ),
            ],
          ),
        ],
      ));
}

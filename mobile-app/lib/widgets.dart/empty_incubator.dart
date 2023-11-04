import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_and_delete_button.dart';
import 'cardslist.dart';
import 'circulebutton.dart';
import '../style/color.dart';
import 'deletedialog.dart';
import 'widgetsforbabyinfopage.dart';

Widget embtyIncubators(
    BuildContext context, Widget details, routePage, Function() cancle) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.78,
    width: MediaQuery.of(context).size.width * 0.98,
    child: Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(context, 'Incubator Id', 'incubator',
              'assets/image/incubator1.jpg', cancle), () {
        dialogForAddEmPtyIncubator;
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return dialogForAddEmPtyIncubator(context, details);
            });
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: cardList(
                  context,
                  'assets/image/incubator1.jpg',
                  'Code:1234',
                  '',
                  circuleButtonWithNavigator(
                    context,
                    routePage,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconSvgBuild('assets/image/add1.svg', iconOfAdminClr),
                      ],
                    ),
                    borderOfAdminClr,
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ),
  );
}

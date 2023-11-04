import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cardslist.dart';

Widget busyIncubator(BuildContext context, routePage, Function() cancle) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.78,
    width: MediaQuery.of(context).size.width * 0.98,
    child: Scaffold(
      /* floatingActionButton: circuleButtonWithDialog(
        deleteDialog(
            context, 'Baby Code', 'baby', 'assets/image/baby.jpg', cancle),
        context,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconSvgBuild('assets/image/delete1.svg', iconOfAdminClr),
          ],
        ),
        iconOfAdminClr,
      ),*/
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => routePage));
              },
              child: cardList(context, "assets/image/baby.jpg",
                  'Baby Code :1234', 'Birth date :../../....', Container()),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ]),
      ),
    ),
  );
}

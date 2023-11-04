import '../style/color.dart';
import 'widgetsofdeletedialog.dart';

import 'package:flutter/material.dart';

deleteDialog(BuildContext context, String line1, String line2, String image,
    Function() cancel) {
  return Center(
    child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: Builder(builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.33),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.84,
                    height: MediaQuery.of(context).size.height * 0.34,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: edtButtonClr)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /* SizedBox(
                          height: 5.h,
                        ),*/
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(26)),
                          child: Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.14,
                            fit: BoxFit.fill,
                          ),
                        ),
                        /* SizedBox(
                          height: 4.h,
                        ),*/
                        textOfDeleteDialog('Do You want to delete $line1?'),
                        /* SizedBox(
                          height: 5.h,
                        ),*/
                        textOfDeleteDialog('You will lose all of $line2 data'),
                        /* SizedBox(
                          height: 5.h,
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buttonsOfDeleteDialog(
                                iconOfAdminClr, 'Cancel', cancel),
                            buttonsOfDeleteDialog(edtButtonClr, 'Delete', () {})
                          ],
                        ),
                        /* SizedBox(
                          height: 20.h,
                        )*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        })),
  );
}

dialogForAddEmPtyIncubator(BuildContext context, Widget details) {
  return Center(
    child: AlertDialog(
        scrollable: true,
        backgroundColor: const Color.fromRGBO(226, 226, 226, 0.2),
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: Builder(builder: (context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.99,
              width: MediaQuery.of(context).size.width * 0.99,
              child: details);
        })),
  );
}

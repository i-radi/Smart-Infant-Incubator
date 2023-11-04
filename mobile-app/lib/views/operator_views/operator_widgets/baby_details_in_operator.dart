import 'package:final_project/views/operator_views/operator_widgets/baby_info_details_in_operator.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum switchButton { save, edit }

class BabyDetailsInOperator extends StatefulWidget {
  const BabyDetailsInOperator({Key? key}) : super(key: key);

  @override
  _BabyDetailsInOperatorState createState() => _BabyDetailsInOperatorState();
}

class _BabyDetailsInOperatorState extends State<BabyDetailsInOperator> {
  switchButton clickButton = switchButton.save;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 65.h),
      child: switchButtonClick(),
    );
  }

  Widget switchButtonClick() {
    switch (clickButton) {
      case switchButton.edit:
        return editWidgets();
      case switchButton.save:
        return saveWidgets();
    }
  }

  Widget editButton(BuildContext ctx) {
    return TextButton(
        onPressed: () {
          setState(() {
            clickButton = switchButton.edit;
          });
        },
        child: Text(
          'Edit',
          textScaleFactor: 1.2,
          style: TextStyle(fontSize: 16.sp, color: edtButtonClr),
        ));
  }

  Widget editWidgets() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.57,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 28.w, top: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      editDetails(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              clickButton = switchButton.save;
                            });
                          },
                          child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 0.5, color: iconOfAdminClr),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  iconSvgBuild(
                                      'assets/image/save.svg', Colors.black),
                                ],
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 1,
        )
      ],
    );
  }

  Widget saveWidgets() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            editButton(context),
          ],
        ),
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.509,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  saveDetails(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

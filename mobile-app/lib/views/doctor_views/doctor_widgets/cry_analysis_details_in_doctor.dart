import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../widgets.dart/percentagecircule.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/details_of_call_dialog.dart';
import '../../../widgets.dart/pop_up_menu.dart';

enum Widgets { on, off }

class CryAnalysisDetailsInDoctor extends StatefulWidget {
  const CryAnalysisDetailsInDoctor({Key? key}) : super(key: key);

  @override
  _CryAnalysisDetailsInDoctorState createState() =>
      _CryAnalysisDetailsInDoctorState();
}

class _CryAnalysisDetailsInDoctorState
    extends State<CryAnalysisDetailsInDoctor> {
  Widgets selectWidget = Widgets.on;
  String formattedDate = DateFormat('hh:mm a').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    List colors = [];
    colors.length = 4;
    var percentValue = [];
    var doubleValue = [];
    doubleValue.length = 4;
    percentValue.length = 4;
    colors.length = 4;
    for (var i = 0; i < 4; i++) {
      doubleValue[i] = Random().nextDouble();
      var valPercent2 = doubleValue[i] * 100;
      String formatted = valPercent2.toStringAsFixed(0);
      percentValue[i] = double.parse(formatted);
      if (doubleValue[i] == 0) {
        colors[i] = white;
      } else if (doubleValue[i] <= 0.5) {
        colors[i] = milkyClr;
      } else if (doubleValue[i] <= 0.75) {
        colors[i] = y;
      } else {
        colors[i] = edtButtonClr;
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: 120.h),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: popUpMenu(
            context,
            motherDetails(milkyClr),
            milkyClr,
            'Mother',
            'Nurse',
            nurseAndDoctorDetails(
                context, 'Nurse Name', 'assets/image/nurse5.jpg', milkyClr)),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  percentageCircule(
                      ' Hungry', doubleValue[0], percentValue[0], colors[0]),
                  percentageCircule(
                      '    Pain  ', doubleValue[1], percentValue[1], colors[1]),
                  percentageCircule(
                      '   Fussy', doubleValue[2], percentValue[2], colors[2]),
                  percentageCircule(
                      '   Angry', doubleValue[3], percentValue[3], colors[3]),
                ],
              ),
              Column(
                children: [selects()],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selects() {
    switch (selectWidget) {
      case Widgets.on:
        return start();
      case Widgets.off:
        return again();
    }
  }

  Widget start() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectWidget = Widgets.off;
            });
          },
          child: Container(
            width: 90.w,
            height: 32.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Start',
                  textScaleFactor: 1,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.mic,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Last update  $formattedDate',
          textScaleFactor: 1,
          style: TextStyle(
              color: edtButtonClr,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget again() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectWidget = Widgets.on;
            });
          },
          child: Container(
            width: 90.w,
            height: 32.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Again',
                  textScaleFactor: 1,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.mic,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

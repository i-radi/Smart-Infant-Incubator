import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/details_of_call_dialog.dart';
import 'package:final_project/widgets.dart/pop_up_menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControlIncubatorDetailsInDoctor extends StatefulWidget {
  const ControlIncubatorDetailsInDoctor({Key? key}) : super(key: key);

  @override
  State<ControlIncubatorDetailsInDoctor> createState() =>
      _ControlIncubatorDetailsInDoctorState();
}

class _ControlIncubatorDetailsInDoctorState
    extends State<ControlIncubatorDetailsInDoctor> {
  int counter = 1;
  bool offButton = true;
  bool onButton = false;

  Widget buildRow(
      String txt,
      Color clr,
      Function() addIconsFun,
      Function() removIconsFun,
      Function() buttonfun1,
      Function() buttonfun2,
      String txtCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              txt,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        // const SizedBox(width: 40,),
        Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 30.h,
              width: 120.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: milkyClr),
                  borderRadius: BorderRadius.circular(8),
                  color: clr,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.16),
                      offset: const Offset(0, 3),
                      blurRadius: 3,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: addIconsFun,
                    icon: const Icon(
                      Icons.add,
                      size: 24,
                    ),
                  ),
                  Text(
                    txtCount,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: milkyClr),
                  ),
                  IconButton(
                    onPressed: removIconsFun,
                    icon: const Icon(
                      Icons.remove,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: buttonfun1,
              child: Text(
                'Turn off',
                textScaleFactor: 1,
                style: TextStyle(fontSize: 16.sp),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    offButton ? edtButtonClr : controlButtonOff),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: buttonfun2,
              child: Text(
                'Turn on',
                textScaleFactor: 1,
                style: TextStyle(fontSize: 16.sp),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    onButton ? milkyClr : controlButtonOff),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              children: [
                buildRow(
                  'Heater',
                  onButton ? controlButtonOff : pageOfNurseClr,
                  //function of add icon1
                  () {
                    setState(() {
                      counter++;
                    });
                  },
                  //function of remove icon1
                  () {
                    setState(() {
                      counter--;
                    });
                  },
                  //function of turn off button1
                  () {
                    setState(() {
                      onButton = false;
                      offButton = true;
                    });
                  },
                  //function of turn on button1
                  () {
                    setState(() {
                      offButton = false;
                      onButton = true;
                    });
                  },
                  '$counter',
                ),
                SizedBox(
                  height: 20.h,
                ),
                buildRow(
                  'Fan      ',
                  onButton ? controlButtonOff : pageOfNurseClr,
                  //function of add icon2
                  () {
                    setState(() {
                      counter++;
                    });
                  },
                  //function of remove icon2
                  () {
                    setState(() {
                      counter--;
                    });
                  },
                  //function of turn off button2
                  () {
                    setState(() {
                      onButton = false;
                      offButton = true;
                    });
                  },
                  //function of turn on button2
                  () {
                    setState(() {
                      onButton = true;
                      offButton = false;
                    });
                  },
                  '$counter',
                ),
                SizedBox(
                  height: 20.h,
                ),
                buildRow(
                  'Motor ',
                  onButton ? controlButtonOff : pageOfNurseClr,
                  //function of add icon3
                  () {
                    setState(() {
                      counter++;
                    });
                  },
                  //function of remove icon3
                  () {
                    setState(() {
                      counter--;
                    });
                  },
                  //function of turn off button3
                  () {
                    setState(() {
                      offButton = true;
                      onButton = false;
                    });
                  },
                  //function of turn on button3
                  () {
                    setState(() {
                      onButton = true;
                      offButton = false;
                    });
                  },
                  '$counter',
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 60.h,
              ),
              popUpMenu(
                  context,
                  motherDetails(milkyClr),
                  milkyClr,
                  'Mother',
                  'Nurse',
                  nurseAndDoctorDetails(context, 'Nurse Name',
                      'assets/image/nurse5.jpg', milkyClr)),
            ],
          )
        ],
      ),
    );
  }
}

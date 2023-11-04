import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/container_of_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDetailsInNurse extends StatefulWidget {
  const NotificationDetailsInNurse({Key? key}) : super(key: key);

  @override
  _NotificationDetailsInNurseState createState() =>
      _NotificationDetailsInNurseState();
}

class _NotificationDetailsInNurseState
    extends State<NotificationDetailsInNurse> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: iconOfNurseClr),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile.adaptive(
                  activeColor: Colors.white,
                  activeTrackColor: iconOfNurseClr,
                  title: Text(
                    'Allow Notification',
                    textScaleFactor: 1,
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
                  ),
                  value: isSwitched,
                  onChanged: (newValue) {
                    setState(() {
                      isSwitched = newValue;
                    });
                  }),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Column(
            children: [
              buildUnReadContainerOfNotifications(
                  context,
                  'Warning!',
                  'baby code 1234 his temperature raised',
                  borderOfNurseClr,
                  pageOfNurseClr,
                  () {},
                  edtButtonClr),
              buildUnReadContainerOfNotifications(
                  context,
                  'Attention!',
                  'A new babe added , his code is 4321',
                  borderOfNurseClr,
                  pageOfNurseClr,
                  () {},
                  Colors.orange),
              buildReadContainerOfNotifications(
                  context,
                  'Warning!',
                  'baby code 1234 his temperature raised',
                  borderOfNurseClr,
                  pageOfNurseClr,
                  () {}),
            ],
          )
        ],
      ),
    );
  }
}

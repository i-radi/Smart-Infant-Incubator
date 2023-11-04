import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/color.dart';
import '../../../widgets.dart/container_of_notifications.dart';

class NotificationDetailsInAdmin extends StatefulWidget {
  const NotificationDetailsInAdmin({Key? key}) : super(key: key);

  @override
  State<NotificationDetailsInAdmin> createState() =>
      _NotificationDetailsInAdminState();
}

class _NotificationDetailsInAdminState
    extends State<NotificationDetailsInAdmin> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: iconOfAdminClr),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile.adaptive(
                activeColor: Colors.white,
                activeTrackColor: iconOfAdminClr,
                title: Text(
                  'Allow Notification',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
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
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: double.infinity,
          height: 469.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildUnReadContainerOfNotifications(
                    context,
                    '',
                    'baby code 1234 his temperature raised',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {},
                    edtButtonClr),
                buildReadContainerOfNotifications(
                    context,
                    '',
                    'A new babe added , his code is 4321',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {}),
                buildReadContainerOfNotifications(
                    context,
                    '',
                    'baby code 1234 his temperature raised',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {}),
                buildReadContainerOfNotifications(
                    context,
                    '',
                    'A new babe added , his code is 4321',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {}),
                buildReadContainerOfNotifications(
                    context,
                    '',
                    'baby code 1234 his temperature raised',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {}),
                buildReadContainerOfNotifications(
                    context,
                    '',
                    'A new babe added , his code is 4321',
                    borderOfAdminClr,
                    containerOfNotificationClr,
                    () {}),
              ],
            ),
          ),
        )
      ],
    );
  }
}

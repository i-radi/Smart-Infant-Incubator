import 'package:final_project/views/operator_views/operator_screens/admin_in_operator_screen.dart';
import 'package:final_project/views/operator_views/operator_screens/baby_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/doctor_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/notification_in_operator_screen.dart';
import 'package:final_project/views/operator_views/operator_screens/nurse_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/operators_list_in_operator_screen.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/drawer_details_widget.dart';
import 'package:final_project/widgets.dart/main_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerInOperator extends StatelessWidget {
  const DrawerInOperator({this.fromOperatorHome = false, Key? key})
      : super(key: key);

  final bool fromOperatorHome;

  @override
  Widget build(BuildContext context) {
    ImageProvider img = const AssetImage('assets/image/operator1.jpg');
    return buildMainDrawer(
      context,
      drawerOfAdminClr,
      iconOfAdminClr,
      white,
      img,
      'Operator Name',
      () {
        Navigator.of(context).pushReplacementNamed('/');
      },
      Column(
        children: [
          buildTextIconInDrawer(
              ('assets/image/doubleperson.svg'), 'Operators', context, () {
            if (fromOperatorHome) {
              Navigator.of(context)
                  .pushNamed(OperatorListInOperatorScreen.namedRoute);
            } else {
              Navigator.of(context).pushReplacementNamed(
                  OperatorListInOperatorScreen.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/adminicon.svg'), 'Adminstrator', context, () {
            if (fromOperatorHome) {
              Navigator.of(context).pushNamed(AdminInOperatorScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(AdminInOperatorScreen.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/doctoricon.svg'), 'Doctors', context, () {
            if (fromOperatorHome) {
              Navigator.of(context)
                  .pushNamed(DoctorListScreenViewOperator.namedRoute);
            } else {
              Navigator.of(context).pushReplacementNamed(
                  DoctorListScreenViewOperator.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(('assets/image/person.svg'), 'Nurse', context,
              () {
            if (fromOperatorHome) {
              Navigator.of(context)
                  .pushNamed(NurseListScreenViewOperator.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NurseListScreenViewOperator.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/incubator.svg'), 'Incubator', context, () {
            if (fromOperatorHome) {
              Navigator.of(context)
                  .pushNamed(BabyListScreenViewOperator.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BabyListScreenViewOperator.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/notifications.svg'), 'Notifications', context, () {
            if (fromOperatorHome) {
              Navigator.of(context)
                  .pushNamed(NotificationInOperatorScreen.namedRoute);
            } else {
              Navigator.of(context).pushReplacementNamed(
                  NotificationInOperatorScreen.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(('assets/image/logout.svg'), 'logout', context,
              () {
            Navigator.of(context).pushReplacementNamed('/');
          }, white),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: SvgPicture.asset(
          'assets/image/babydrawer.svg',
          height: 75.h,
        ),
      ),
    );
  }
}

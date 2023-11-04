import 'package:final_project/views/admin_views/admin_screens/admin_screen.dart';
import 'package:final_project/views/admin_views/admin_screens/baby_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/doctor_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/nurse_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/operator_list_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../admin_screens/notification_in_admin_screen.dart';
import '../../../style/color.dart';
import '../../../../widgets.dart/drawer_details_widget.dart';
import '../../../../widgets.dart/main_drawer.dart';

class DrawerInAdmin extends StatelessWidget {
  const DrawerInAdmin({this.fromAdminHome = false, Key? key}) : super(key: key);

  final bool fromAdminHome;

  @override
  Widget build(BuildContext context) {
    ImageProvider img = const AssetImage('assets/image/administrator.jpg');
    return buildMainDrawer(
      context,
      drawerOfAdminClr,
      iconOfAdminClr,
      white,
      img,
      'Admin Name',
      () {
        Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
      },
      Column(
        children: [
          buildTextIconInDrawer(
              ('assets/image/doubleperson.svg'), 'Operators', context, () {
            if (fromAdminHome) {
              Navigator.of(context)
                  .pushNamed(OperatorListInAdminScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pop();
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/doctoricon.svg'), 'Doctors', context, () {
            if (fromAdminHome) {
              Navigator.of(context)
                  .pushNamed(DoctorListScreenViewAdmin.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(DoctorListScreenViewAdmin.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(('assets/image/person.svg'), 'Nurse', context,
              () {
            if (fromAdminHome) {
              Navigator.of(context)
                  .pushNamed(NurseListScreenViewAdmin.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NurseListScreenViewAdmin.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/incubator.svg'), 'Incubator', context, () {
            if (fromAdminHome) {
              Navigator.of(context)
                  .pushNamed(BabyListScreenViewAdmin.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BabyListScreenViewAdmin.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(
              ('assets/image/notifications.svg'), 'Notifications', context, () {
            if (fromAdminHome) {
              Navigator.of(context)
                  .pushNamed(NotificationInAdminScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NotificationInAdminScreen.namedRoute);
            }
          }, white),
          buildTextIconInDrawer(('assets/image/logout.svg'), 'logout', context,
              () {
            Navigator.of(context).pushReplacementNamed('/');
          }, white),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 60.h),
        child: SvgPicture.asset(
          'assets/image/babydrawer.svg',
          height: 75.h,
        ),
      ),
    );
  }
}

import 'package:final_project/views/nurse_views/nurse_screens/nurse_screen.dart';
import 'package:final_project/widgets.dart/main_drawer.dart';
import '../../../views/nurse_views/nurse_screens/admin_in_nurse_screen.dart';
import '../../../views/nurse_views/nurse_screens/baby_list_screen_view_nurse.dart';
import '../../../views/nurse_views/nurse_screens/doctor_list_screen_view_nurse.dart';
import '../../../views/nurse_views/nurse_screens/notification_in_nurse_screen.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/drawer_details_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerInNurse extends StatelessWidget {
  const DrawerInNurse({this.fromNureHome = false, key}) : super(key: key);
  final bool fromNureHome;

  @override
  Widget build(BuildContext context) {
    ImageProvider img = const AssetImage('assets/image/nurse5.jpg');
    return buildMainDrawer(
      context,
      drawerOfNurseClr,
      borderOfNurseClr,
      black,
      img,
      'Nurse Name',
      () {
        Navigator.of(context).pushReplacementNamed(NurseScreen.namedRoute);
      },
      Column(
        children: [
          buildTextIconInDrawer(
              'assets/image/doctoricon.svg', 'Doctors', context, () {
            if (fromNureHome) {
              Navigator.of(context)
                  .pushNamed(DoctorListScreenViewNurse.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(DoctorListScreenViewNurse.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/incubator.svg', 'Incubator', context, () {
            if (fromNureHome) {
              Navigator.of(context)
                  .pushNamed(BabyListScreenViewNurse.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BabyListScreenViewNurse.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/notifications.svg', 'Notification', context, () {
            if (fromNureHome) {
              Navigator.of(context)
                  .pushNamed(NotificationInNurseScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NotificationInNurseScreen.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/doubleperson.svg', 'Adminstrator', context, () {
            if (fromNureHome) {
              Navigator.of(context).pushNamed(AdminInNurseScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(AdminInNurseScreen.namedRoute);
            }
          }, black),
          buildTextIconInDrawer('assets/image/logout.svg', 'Log out', context,
              () {
            Navigator.of(context).pushReplacementNamed('/');
          }, black),
          SizedBox(
            height: 120.h,
          ),
        ],
      ),
      SvgPicture.asset(
        'assets/image/babydrawer.svg',
        height: 75.h,
      ),
    );
  }
}

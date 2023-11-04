import 'package:final_project/views/doctor_views/doctor_screens/doctor_screen.dart';
import 'package:final_project/widgets.dart/main_drawer.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/drawer_details_widget.dart';
import '../doctor_screens/admin_in_doctor_screen.dart';
import '../doctor_screens/baby_list_screen_view.dart';
import '../doctor_screens/notification_in_doctor_screen.dart';
import '../doctor_screens/nurse_list_screen_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerInDoctor extends StatelessWidget {
  const DrawerInDoctor({this.fromDoctorHome = false, Key? key})
      : super(key: key);

  final bool fromDoctorHome;
  @override
  Widget build(BuildContext context) {
    ImageProvider img = const AssetImage('assets/image/doctor1.jpg');
    return buildMainDrawer(
      context,
      drawerOfDocClr,
      borderOfDocPageClr,
      black,
      img,
      'Doctor Name',
      () {
        Navigator.of(context).pushNamed(DoctorScreen.namedRoute);
      },
      Column(
        children: [
          buildTextIconInDrawer('assets/image/person.svg', 'Nurses', context,
              () {
            if (fromDoctorHome) {
              Navigator.of(context)
                  .pushNamed(NurseListScreenViewDoctor.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NurseListScreenViewDoctor.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/incubator.svg', 'Incubator', context, () {
            if (fromDoctorHome) {
              Navigator.of(context)
                  .pushNamed(BabyListScreenViewDoctor.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BabyListScreenViewDoctor.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/notifications.svg', 'Notification', context, () {
            if (fromDoctorHome) {
              Navigator.of(context)
                  .pushNamed(NotificationInDoctorScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NotificationInDoctorScreen.namedRoute);
            }
          }, black),
          //buildTextIcon(Icons.speaker_phone_rounded, 'Cry Analysis', context),
          buildTextIconInDrawer(
              'assets/image/adminicon.svg', 'Adminstrator', context, () {
            if (fromDoctorHome) {
              Navigator.of(context).pushNamed(AdminInDoctorScreen.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(AdminInDoctorScreen.namedRoute);
            }
          }, black),
          buildTextIconInDrawer('assets/image/logout.svg', 'Log out', context,
              () {
            Navigator.of(context).pushReplacementNamed('/');
          }, black),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 120.h),
        child: SvgPicture.asset(
          'assets/image/babydrawer.svg',
          height: 75.h,
        ),
      ),
    );
  }
}

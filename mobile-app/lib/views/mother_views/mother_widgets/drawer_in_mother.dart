import 'package:final_project/views/mother_views/mother_screens/baby_list_screen_mother.dart';
import 'package:final_project/views/mother_views/mother_screens/mother_screen.dart';
import 'package:final_project/widgets.dart/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mother_screens/doctor_profile_in_mother.dart';
import '../mother_screens/nurse_profile_in_mother.dart';
import '../../../style/color.dart';
import '../../../../widgets.dart/drawer_details_widget.dart';

class DrawerInMother extends StatelessWidget {
  const DrawerInMother({this.fromMotherHome = false, key}) : super(key: key);
  final bool fromMotherHome;

  @override
  Widget build(BuildContext context) {
    ImageProvider img = const AssetImage('assets/image/motherprofile.jpg');
    return buildMainDrawer(
      context,
      drawerOfMotherClr,
      borderOfMotherClr,
      black,
      img,
      'Mother Name',
      () {
        Navigator.of(context).pushReplacementNamed(MotherScreen.namedRoute);
      },
      Column(
        children: [
          buildTextIconInDrawer(
              'assets/image/heartdrawer.svg', 'My baby', context, () {
            if (fromMotherHome) {
              Navigator.of(context).pushNamed(BabyListScreenMother.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(BabyListScreenMother.namedRoute);
            }
          }, black),
          buildTextIconInDrawer(
              'assets/image/doctoricon.svg', 'Doctor', context, () {
            if (fromMotherHome) {
              Navigator.of(context).pushNamed(DoctorProfileInMother.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(DoctorProfileInMother.namedRoute);
            }
          }, black),
          buildTextIconInDrawer('assets/image/person.svg', 'Nurse', context,
              () {
            if (fromMotherHome) {
              Navigator.of(context).pushNamed(NurseProfileInMother.namedRoute);
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(NurseProfileInMother.namedRoute);
            }
          }, black),
          buildTextIconInDrawer('assets/image/logout.svg', 'Log out', context,
              () {
            Navigator.of(context).pushReplacementNamed('/');
          }, black),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 190.h),
        child: SvgPicture.asset(
          'assets/image/babydrawer.svg',
          height: 75.h,
        ),
      ),
    );
  }
}

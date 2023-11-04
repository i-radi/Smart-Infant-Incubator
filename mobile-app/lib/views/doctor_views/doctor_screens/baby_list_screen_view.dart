import '/views/doctor_views/doctor_widgets/baby_list_details_in_doctor.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import 'doctor_screen.dart';

import 'package:flutter/material.dart';


class BabyListScreenViewDoctor extends StatelessWidget {
  const BabyListScreenViewDoctor({Key? key}) : super(key: key);
  static const namedRoute = '/baby-list-screen-doctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          appBarTxt: 'Incubator',
          leadingColor: black,
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          drawerClr: drawerOfDocClr,
          fun: () {
            Navigator.of(context).pushReplacementNamed(DoctorScreen.namedRoute);
          }),
      endDrawer: const DrawerInDoctor(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: const BabyListDetailsInDoctor(),
    );
  }
}

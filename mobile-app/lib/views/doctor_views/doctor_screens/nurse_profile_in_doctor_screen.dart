import 'package:flutter/material.dart';

import 'package:final_project/views/doctor_views/doctor_screens/nurse_list_screen_view.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/views/doctor_views/doctor_widgets/drawer_in_doctor.dart';
import 'package:final_project/views/doctor_views/doctor_widgets/nurse_in_doctor_details.dart';

class NurseProfileInDoctorScreen extends StatelessWidget {
  static const namedRoute = '/nurse-profile-in-doctor-screen';
  const NurseProfileInDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(NurseListScreenViewDoctor.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: milkyClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInDoctor(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(
          context, const NurseInDoctorDetails(), milkyClr, pageOfDoctorsClr),
    );
  }
}

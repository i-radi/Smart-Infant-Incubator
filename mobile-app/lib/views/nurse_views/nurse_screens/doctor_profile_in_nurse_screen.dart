import 'package:flutter/material.dart';

import '../../../views/nurse_views/nurse_screens/doctor_list_screen_view_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/doctor_details_in_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';

class DoctorProfileInNurseScreen extends StatelessWidget {
  static const namedRoute = '/doctor-profile-in-nurse-screen';
  const DoctorProfileInNurseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(DoctorListScreenViewNurse.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfNurseClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInNurse(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const DoctorDetailsInNurse(), iconOfNurseClr,
          pageOfNurseClr),
    );
  }
}

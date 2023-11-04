import 'package:final_project/views/admin_views/admin_screens/doctor_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../admin_widgets/drawer_in_admin.dart';
import '../admin_widgets/form_field_of_doctor_in_admin.dart';
import '../admin_widgets/imge_box_of_doctor_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class DoctorInfoInAdminScreen extends StatelessWidget {
  static const namedRoute = '/doctor-info-in-admin-screen';

  const DoctorInfoInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Doctor informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(DoctorListScreenViewAdmin.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfAdminClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ImageBoxOfDoctorInAdmin(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfDoctorInAdmin(),
          ],
        ),
      ),
    );
  }
}

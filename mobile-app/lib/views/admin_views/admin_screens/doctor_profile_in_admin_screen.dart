import 'package:final_project/views/admin_views/admin_screens/doctor_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../admin_widgets/doctor_details_in_admin.dart';
import '../admin_widgets/drawer_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

class DoctorProfileInAdminScreen extends StatelessWidget {
  const DoctorProfileInAdminScreen({Key? key}) : super(key: key);

  static const namedRoute = '/doctor-profile-in-admin-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushReplacementNamed(DoctorListScreenViewAdmin.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const DoctorDetailsInAdmin(), borderOfAdminClr,
          pageOfAdminClr),
    );
  }
}

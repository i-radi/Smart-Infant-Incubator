import 'package:final_project/views/admin_views/admin_screens/nurse_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../admin_widgets/drawer_in_admin.dart';
import '../admin_widgets/form_field_of_nurse_in_admin.dart';
import '../admin_widgets/image_box_of_nurse_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class NurseInfoInAdminScreen extends StatelessWidget {
  static const namedRoute = '/nurse-info-in-admin-screen';

  const NurseInfoInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Nurse informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(NurseListScreenViewAdmin.namedRoute);
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
            ImageBoxOfNurseInAdmin(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfNurseInAdmin(),
          ],
        ),
      ),
    );
  }
}

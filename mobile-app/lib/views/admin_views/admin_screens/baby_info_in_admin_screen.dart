import 'package:final_project/views/admin_views/admin_screens/baby_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../admin_widgets/drawer_in_admin.dart';
import '../admin_widgets/form_field_of_baby_in_admin.dart';
import '../admin_widgets/image_box_of_baby_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class BabyInfoInAdminScreen extends StatelessWidget {
  static const namedRoute = '/baby-info-in-admin-screen';

  const BabyInfoInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Baby informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(BabyListScreenViewAdmin.namedRoute);
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
            ImageBoxOfBabyInAdmin(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfBabyInAdmin(),
          ],
        ),
      ),
    );
  }
}

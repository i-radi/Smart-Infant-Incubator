import 'package:final_project/views/admin_views/admin_screens/operator_list_admin.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';
import '../admin_widgets/drawer_in_admin.dart';
import '../admin_widgets/form_field_of_operator_in_admin.dart';
import '../admin_widgets/imge_box_of_operator_in_admin.dart';

class OperatorInfoInAdminScreen extends StatelessWidget {
  const OperatorInfoInAdminScreen({Key? key}) : super(key: key);
  static const namedRoute = '/operator-info-in-admin-screen';
  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Operator informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(OperatorListInAdminScreen.namedRoute);
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
            ImageBoxOfOperatorInAdmin(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfOperatorInAdmin(),
          ],
        ),
      ),
    );
  }
}

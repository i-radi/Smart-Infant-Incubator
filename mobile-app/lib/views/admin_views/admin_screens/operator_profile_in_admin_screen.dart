import 'package:final_project/views/admin_views/admin_screens/operator_list_admin.dart';
import '../admin_widgets/drawer_in_admin.dart';
import '../admin_widgets/operator_details_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

import 'package:flutter/material.dart';


class OperatorProfileInAdminScreen extends StatelessWidget {
  const OperatorProfileInAdminScreen({Key? key}) : super(key: key);
  static const namedRoute = '/operator-profile-in-admin-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context).pushReplacementNamed(OperatorListInAdminScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const OperatorDetailsInAdmin(),
          iconOfAdminClr.withOpacity(0.2), pageOfAdminClr),
    );
  }
}

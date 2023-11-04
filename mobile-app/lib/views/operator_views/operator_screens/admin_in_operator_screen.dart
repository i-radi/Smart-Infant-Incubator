import 'package:final_project/views/operator_views/operator_screens/operator_screen.dart';
import 'package:flutter/material.dart';

import '../operator_widgets/admin_details_in_operator.dart';
import '../operator_widgets/drawer_in_operator.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

class AdminInOperatorScreen extends StatelessWidget {
  static const namedRoute = '/admin-in-operator-screen';
  const AdminInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const AdminDetailsInOperator(),
          borderOfAdminClr, pageOfAdminClr),
    );
  }
}

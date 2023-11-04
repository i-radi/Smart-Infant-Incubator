import 'package:final_project/views/operator_views/operator_widgets/drawer_in_operator.dart';
import 'package:final_project/views/operator_views/operator_widgets/operator_profile_details_in_operator.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';

import 'operators_list_in_operator_screen.dart';

class OperatorInOperatorScreen extends StatelessWidget {
  static const namedRoute = 'operator-in-operator-screen';
  const OperatorInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushReplacementNamed(OperatorListInOperatorScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const OperatorProfileDetailsInOperator(),
          borderOfAdminClr, pageOfAdminClr),
    );
  }
}

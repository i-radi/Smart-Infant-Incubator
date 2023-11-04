import 'package:final_project/views/operator_views/operator_widgets/drawer_in_operator.dart';
import 'package:final_project/views/operator_views/operator_widgets/form_field_of_nurse_in_operator.dart';
import 'package:final_project/views/operator_views/operator_widgets/image_box_of_nurse_in_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/nurse_list_screen_view_operator.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/style/color.dart';

import 'package:flutter/material.dart';

class NurseInfoInOperatorScreen extends StatelessWidget {
  static const namedRoute = '/nurse-info-in-operator-screen';
  const NurseInfoInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Nurse informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(NurseListScreenViewOperator.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfAdminClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ImageBoxOfNurseInOperator(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfNurseInOperato(),
          ],
        ),
      ),
    );
  }
}

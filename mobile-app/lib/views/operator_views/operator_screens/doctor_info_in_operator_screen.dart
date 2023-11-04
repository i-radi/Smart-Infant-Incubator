import 'package:flutter/material.dart';

import '../operator_widgets/drawer_in_operator.dart';
import '../operator_widgets/form_field_of_doctor_in_operator.dart';
import '../operator_widgets/image_box_of_doctor_in_operator.dart';
import 'doctor_list_screen_view_operator.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class DoctorInfoInOperatorScreen extends StatelessWidget {
  static const namedRoute = '/doctor-info-in-operator-screen';
  const DoctorInfoInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Doctor informations',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(DoctorListScreenViewOperator.namedRoute);
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
            ImageBoxOfDoctorInOperator(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfDoctorInOperator(),
          ],
        ),
      ),
    );
  }
}

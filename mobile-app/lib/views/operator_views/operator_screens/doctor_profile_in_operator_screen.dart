import 'package:flutter/material.dart';

import '../operator_widgets/doctor_details_in_operator.dart';
import '../operator_widgets/drawer_in_operator.dart';
import 'doctor_list_screen_view_operator.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

class DoctorProfileInOperatorScreen extends StatelessWidget {
  static const namedRoute = 'doctor-profile-in-operator-screen';
  const DoctorProfileInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushReplacementNamed(DoctorListScreenViewOperator.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const DoctorDetailsInOperator(),
          borderOfAdminClr, pageOfAdminClr),
    );
  }
}

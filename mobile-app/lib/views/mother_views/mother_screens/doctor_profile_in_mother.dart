import 'package:flutter/material.dart';

import '../mother_widgets/doctor_details_in_mother.dart';
import '../mother_widgets/drawer_in_mother.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import 'mother_screen.dart';

class DoctorProfileInMother extends StatelessWidget {
  static const namedRoute = '/doctor-profile-in-mother-screen';
  const DoctorProfileInMother({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context).pushReplacementNamed(MotherScreen.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfMotherClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInMother(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const DoctorDetailsInMother(), iconOfMotherClr,
          pageOfMotherClr),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/doctor_list_screen_details_in_nurse.dart';

import 'nurse_screen.dart';

class DoctorListScreenViewNurse extends StatelessWidget {
  const DoctorListScreenViewNurse({Key? key}) : super(key: key);
  static const namedRoute = '/doctor-list-in-nurse-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithSearchBox(context, iconOfNurseClr, iconOfNurseClr,
            '   search by Doctor  name', () {
          Navigator.of(context).pushReplacementNamed(NurseScreen.namedRoute);
        }),
        endDrawer: const DrawerInNurse(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: const DoctorListScreenDetailsInNurse());
  }
}

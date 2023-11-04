import 'package:final_project/views/doctor_views/doctor_widgets/nurse_list_details_in_doctor.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import 'doctor_screen.dart';

class NurseListScreenViewDoctor extends StatelessWidget {
  static const namedRoute = '/nurse_list_screen_view_doctor';

  const NurseListScreenViewDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithSearchBox(
            context, milkyClr, milkyClr, '   search by nurse ID or name', () {
          Navigator.of(context).pushReplacementNamed(DoctorScreen.namedRoute);
        }),
        endDrawer: const DrawerInDoctor(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: const NurseListDetailsInDoctor());
  }
}

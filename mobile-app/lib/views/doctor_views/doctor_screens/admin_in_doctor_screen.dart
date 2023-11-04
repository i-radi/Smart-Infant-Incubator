import 'package:flutter/material.dart';
import '../doctor_widgets/admins_details_in_doctor.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import 'doctor_screen.dart';

class AdminInDoctorScreen extends StatelessWidget {
  static const namedRoute = '/admin-in-doctor-screen';
  const AdminInDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context).pushReplacementNamed(DoctorScreen.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: milkyClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInDoctor(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const AdminDetailsInDoctor(),
          borderOfDocPageClr, pageOfDoctorsClr),
    );
  }
}

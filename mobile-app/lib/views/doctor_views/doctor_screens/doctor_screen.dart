import 'package:flutter/material.dart';

import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import '../../../widgets.dart/appbar.dart';
import 'notification_in_doctor_screen.dart';
import '../doctor_widgets/doctor_details_page.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);
  static const namedRoute = '/doctor-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushNamed(NotificationInDoctorScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/notificationpage.svg',
        leadingColor: milkyClr,
        sizeOfLeadinIcon: 25,
        drawerClr: milkyClr,
      ),
      endDrawer: const DrawerInDoctor(
        fromDoctorHome: true,
      ),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const DoctorsDetails(), borderOfDocPageClr,
          pageOfDoctorsClr),
    );
  }
}

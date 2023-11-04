import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';
import '../doctor_widgets/doctor_notifications_details.dart';

class NotificationInDoctorScreen extends StatelessWidget {
  static const namedRoute = 'notification-in-doctor-screen';
  const NotificationInDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBarTxt: 'Notifications',
        fun: () {
          Navigator.pop(context);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: milkyClr,
      ),
     // endDrawer: const DrawerInDoctor(),
     // drawerScrimColor: Colors.white.withOpacity(0),
      body: const DoctorNotificationDetails(),
    );
  }
}

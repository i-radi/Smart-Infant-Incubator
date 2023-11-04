import 'package:flutter/material.dart';

import '../../../views/nurse_views/nurse_widgets/notification_details_in_nurse.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/style/color.dart';

class NotificationInNurseScreen extends StatelessWidget {
  static const namedRoute = 'notification-in-nurse-screen';
  const NotificationInNurseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBarTxt: 'Notifications',
        fun: () {
          Navigator.pop(context);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfNurseClr,
      ),
     // endDrawer: const DrawerInNurse(),
     // drawerScrimColor: Colors.white.withOpacity(0),
      body: const NotificationDetailsInNurse(),
    );
  }
}

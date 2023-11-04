import 'package:flutter/material.dart';

import '../admin_widgets/notification_details_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class NotificationInAdminScreen extends StatelessWidget {
  static const namedRoute = 'notification-in-admin-screen';
  const NotificationInAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBarTxt: 'Notification',
        fun: () {
          Navigator.pop(context);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
     // endDrawer: const DrawerInAdmin(),
     // drawerScrimColor: Colors.white.withOpacity(0),
      body: const NotificationDetailsInAdmin(),
    );
  }
}

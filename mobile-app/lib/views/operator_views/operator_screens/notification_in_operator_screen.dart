import 'package:final_project/views/operator_views/operator_widgets/notification_details_in_operator.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';


class NotificationInOperatorScreen extends StatelessWidget {
  static const namedRoute = 'notification-in-operator-screen';
  const NotificationInOperatorScreen({Key? key}) : super(key: key);

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
     // endDrawer: const DrawerInOperator(),
     // drawerScrimColor: Colors.white.withOpacity(0),
      body: const NotificationDetailsInOperator(),
    );
  }
}

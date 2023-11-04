import 'package:final_project/views/operator_views/operator_widgets/drawer_in_operator.dart';
import 'package:final_project/views/operator_views/operator_widgets/operator_details.dart';
import 'package:final_project/views/operator_views/operator_screens/notification_in_operator_screen.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';

import 'package:flutter/material.dart';

class OperatorScreen extends StatelessWidget {
  const OperatorScreen({Key? key}) : super(key: key);
  static const namedRoute = '/operator-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushNamed(NotificationInOperatorScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/notificationpage.svg',
        leadingColor: iconOfAdminClr,
        sizeOfLeadinIcon: 25,
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInOperator(fromOperatorHome: true,),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(
          context, const OperatorDetails(), borderOfAdminClr, pageOfAdminClr),
    );
  }
}

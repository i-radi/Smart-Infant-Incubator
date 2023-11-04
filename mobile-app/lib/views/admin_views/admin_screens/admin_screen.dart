import 'package:final_project/models/auth_model.dart';

import 'notification_in_admin_screen.dart';
import '../admin_widgets/admin_details.dart';
import '../admin_widgets/drawer_in_admin.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

import 'package:flutter/material.dart';


class AdminScreen extends StatelessWidget {
  final Authentication user;
  const AdminScreen({Key? key,required this.user}) : super(key: key);
  static const namedRoute = '/admin-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushNamed(NotificationInAdminScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/notificationpage.svg',
        sizeOfLeadinIcon: 25,
        leadingColor: iconOfAdminClr,
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInAdmin(fromAdminHome: true,),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(
          context,  AdminDetails(
            user: user,
          ), borderOfAdminClr, pageOfAdminClr),
    );
  }
}

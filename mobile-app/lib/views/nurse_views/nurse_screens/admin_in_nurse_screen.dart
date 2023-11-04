import 'package:flutter/material.dart';

import 'nurse_screen.dart';
import '../../../views/nurse_views/nurse_widgets/admin_details_in_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';

class AdminInNurseScreen extends StatelessWidget {
  static const namedRoute = '/admin-in-nurse-screen';
  const AdminInNurseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context).pushReplacementNamed(NurseScreen.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfNurseClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInNurse(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const AdminDetailsInNurse(), borderOfNurseClr,
          pageOfNurseClr),
    );
  }
}

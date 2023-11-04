import 'package:final_project/views/nurse_views/nurse_widgets/baby_info_screen_details_in_nurse.dart';
import 'package:flutter/material.dart';

import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/style/color.dart';
import 'nurse_screen.dart';

class BabyInfoScreenViewNurse extends StatelessWidget {
  const BabyInfoScreenViewNurse({Key? key}) : super(key: key);
  static const namedRoute = '/baby-info-in-nurse-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          fun: () {
            Navigator.of(context).pushReplacementNamed(NurseScreen.namedRoute);
          },
          drawerClr: drawerOfNurseClr,
          appBarTxt: 'Incubator',
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg'),
      endDrawer: const DrawerInNurse(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: const BabyInfoScreenDetailsInNurse(),
    );
  }
}

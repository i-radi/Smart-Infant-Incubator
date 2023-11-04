import '/views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';
import '../../../views/nurse_views/nurse_widgets/baby_list_screen_details_in_nurse.dart';
import 'nurse_screen.dart';

import 'package:flutter/material.dart';

class BabyListScreenViewNurse extends StatelessWidget {
  const BabyListScreenViewNurse({Key? key}) : super(key: key);
  static const namedRoute = '/baby-list-in-nurse-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            fun: () {
              Navigator.of(context)
                  .pushReplacementNamed(NurseScreen.namedRoute);
            },
            drawerClr: drawerOfNurseClr,
            appBarTxt: 'Incubator',
            leadingColor: black,
            leadingSvgiconInAppBar: 'assets/image/backarrow.svg'),
        endDrawer: const DrawerInNurse(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: const BabyListScreenDetailsInNurse());
  }
}

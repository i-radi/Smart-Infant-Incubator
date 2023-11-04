import 'package:final_project/views/nurse_views/nurse_screens/baby_info_screen_view_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/image_and_border_of_baby_in_nurse.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

import 'package:flutter/material.dart';


class ControlIncubatorInNurseScreen extends StatelessWidget {
  static const namedRoute = '/control-incubator-in-nurse-screen';
  const ControlIncubatorInNurseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Control Incubator',
      fun: () {
        Navigator.of(context).pushReplacementNamed(BabyInfoScreenViewNurse.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfNurseClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInNurse(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: const ImageAndBorderOfBabyInNurse(),
    );
  }
}

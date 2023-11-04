import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/cry_analysis_call_for_nurse.dart';
import '../../../views/nurse_views/nurse_screens/baby_info_screen_view_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';

class CryAnalysisScreenViewNurse extends StatelessWidget {
  const CryAnalysisScreenViewNurse({Key? key}) : super(key: key);
  static const namedRoute = '/cry-analysis-in-nurse-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            fun: () {
              Navigator.of(context)
                  .pushReplacementNamed(BabyInfoScreenViewNurse.namedRoute);
            },
            drawerClr: drawerOfNurseClr,
            leadingColor: black,
            leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
            appBarTxt: 'Cry Analysis'),
        endDrawer: const DrawerInNurse(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: Center(
          child: Stack(
            children: <Widget>[
              borderOfBabyPage(
                context,
                const CryAnalysisCallForNurse(),
                borderOfNurseClr,
                pageOfNurseClr,
              ),
              babyImage(context),
            ],
          ),
        ));
  }
}

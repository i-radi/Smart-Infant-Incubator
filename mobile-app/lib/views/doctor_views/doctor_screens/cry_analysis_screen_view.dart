import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../doctor_widgets/cry_analysis_details_in_doctor.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import 'baby_info_screen_view.dart';

class CryAnalysisScreenViewDoctor extends StatelessWidget {
  const CryAnalysisScreenViewDoctor({Key? key}) : super(key: key);
  static const namedRoute = '/cry-analysis-screen-view-doctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          appBarTxt: 'Cry Analysis',
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          drawerClr: milkyClr,
          fun: () {
            Navigator.of(context)
                .pushReplacementNamed(BabyInfoScreenViewDoctor.namedRoute);
          },
        ),
        endDrawer: const DrawerInDoctor(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: Center(
          child: Stack(
            children: <Widget>[
              borderOfBabyPage(
                context,
                const CryAnalysisDetailsInDoctor(),
                borderOfDocPageClr,
                pageOfDoctorsClr,
              ),
              babyImage(context),
            ],
          ),
        ));
  }
}

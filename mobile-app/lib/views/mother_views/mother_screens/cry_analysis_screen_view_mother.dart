import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '/views/mother_views/mother_screens/baby_screen_view_mother.dart';
import '../mother_widgets/cry_analysis_details_in_mother.dart';
import '../mother_widgets/drawer_in_mother.dart';

class CryAnalysisScreenViewMother extends StatelessWidget {
  const CryAnalysisScreenViewMother({Key? key}) : super(key: key);
  static const namedRoute = '/cry-analysis-screen-mother';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            appBarTxt: 'Cry Analysis',
            leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
            fun: () {
              Navigator.of(context)
                  .pushReplacementNamed(BabyScreenViewMother.namedRoute);
            },
            drawerClr: drawerOfMotherClr),
        endDrawer: const DrawerInMother(),
        drawerScrimColor: Colors.white.withOpacity(0),
        body: Center(
          child: Stack(
            children: <Widget>[
              borderOfBabyPage(
                context,
                const CryAnalysisDetailsInMother(),
                borderOfMotherClr,
                pageOfMotherClr,
              ),
              babyImage(context),
            ],
          ),
        ));
  }
}

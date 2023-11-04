import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../mother_widgets/drawer_in_mother.dart';
import '../mother_widgets/baby_screen_details_in_mother.dart';
import 'baby_list_screen_mother.dart';

class BabyScreenViewMother extends StatelessWidget {
  const BabyScreenViewMother({Key? key}) : super(key: key);
  static const namedRoute = '/baby-screen-mother';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          fun: () {
            Navigator.of(context)
                .pushReplacementNamed(BabyListScreenMother.namedRoute);
          },
          drawerClr: drawerOfMotherClr,
          leadingColor: black,
          appBarTxt: 'My Baby',
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg'),
      endDrawer: const DrawerInMother(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: Center(
          child: Stack(
        children: [
          borderOfBabyPage(
            context,
            const BabyScreenDetailsInMother(),
            borderOfMotherClr,
            pageOfMotherClr,
          ),
          babyImage(context)
        ],
      )),
    );
  }
}

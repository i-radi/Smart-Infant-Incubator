import 'package:flutter/material.dart';

import 'mother_screen.dart';
import '../mother_widgets/baby_list_details_in_mother.dart';
import '../mother_widgets/drawer_in_mother.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class BabyListScreenMother extends StatelessWidget {
  const BabyListScreenMother({Key? key}) : super(key: key);
  static const namedRoute = '/baby-list-mother';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          appBarTxt: 'My Baby',
          leadingColor: black,
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          drawerClr: drawerOfMotherClr,
          fun: () {
            Navigator.of(context).pushReplacementNamed(MotherScreen.namedRoute);
          }),
      endDrawer: const DrawerInMother(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: const BabyListDetailsInMother(),
    );
  }
}

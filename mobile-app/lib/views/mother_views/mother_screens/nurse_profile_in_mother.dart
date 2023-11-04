import 'package:flutter/material.dart';

import '../mother_widgets/drawer_in_mother.dart';
import '../mother_widgets/nurse_details_in_mother.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import 'mother_screen.dart';

class NurseProfileInMother extends StatelessWidget {
  static const namedRoute = '/nurse-profile-in-mother-screen';
  const NurseProfileInMother({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context).pushReplacementNamed(MotherScreen.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfMotherClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInMother(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: buildBorder(context, const NurseDetailsInMother(), iconOfMotherClr,
          pageOfMotherClr),
    );
  }
}

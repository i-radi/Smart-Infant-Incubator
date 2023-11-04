import 'package:flutter/material.dart';

import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../../../views/doctor_views/doctor_widgets/baby_info_details_in_doctor.dart';
import '../doctor_widgets/drawer_in_doctor.dart';
import 'baby_list_screen_view.dart';
import '../../../widgets.dart/appbar.dart';

class BabyInfoScreenViewDoctor extends StatelessWidget {
  static const namedRoute = '/baby-info-in-doctor-screen';

  const BabyInfoScreenViewDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          appBarTxt: 'Incubator',
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          leadingColor: black,
          fun: () {
            Navigator.of(context)
                .pushReplacementNamed(BabyListScreenViewDoctor.namedRoute);
          },
          drawerClr: drawerOfDocClr),
      endDrawer: const DrawerInDoctor(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: Center(
        child: Stack(
          children: <Widget>[
            borderOfBabyPage(
              context,
              const BabyInfoDetailsInDoctor(),
              borderOfDocPageClr.withOpacity(0.3),
              pageOfDoctorsClr,
            ),
            babyImage(context),
          ],
        ),
      ),
    );
  }
}

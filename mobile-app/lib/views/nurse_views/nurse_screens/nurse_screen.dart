import 'package:flutter/material.dart';

import '../../../views/nurse_views/nurse_screens/notification_in_nurse_screen.dart';
import '../../../views/nurse_views/nurse_widgets/drawer_in_nurse.dart';
import '../../../views/nurse_views/nurse_widgets/nurse_details.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';

class NurseScreen extends StatelessWidget {
  const NurseScreen({Key? key}) : super(key: key);
  static const namedRoute = '/nurse-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushNamed(NotificationInNurseScreen.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/notificationpage.svg',
        leadingColor: iconOfNurseClr,
        sizeOfLeadinIcon: 25,
        drawerClr: iconOfNurseClr,
      ),
      endDrawer: const DrawerInNurse(fromNureHome: true,),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(
          context, const NurseDetails(), borderOfNurseClr, pageOfNurseClr),
    );
  }
}

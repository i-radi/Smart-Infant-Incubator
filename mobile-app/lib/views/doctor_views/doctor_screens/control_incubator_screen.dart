import 'package:final_project/views/doctor_views/doctor_screens/baby_info_screen_view.dart';
import 'package:final_project/views/doctor_views/doctor_widgets/drawer_in_doctor.dart';
import 'package:final_project/views/doctor_views/doctor_widgets/image_and_border_of_baby_in_doctor.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/style/color.dart';


import 'package:flutter/material.dart';


class ControlIncubatorScreen extends StatefulWidget {
  static const namedRoute = '/control-incubator-in-doctor-screen';
  const ControlIncubatorScreen({Key? key}) : super(key: key);

  @override
  State<ControlIncubatorScreen> createState() => _ControlIncubatorScreenState();
}

class _ControlIncubatorScreenState extends State<ControlIncubatorScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Control Incubator',
      fun: () {
        Navigator.of(context).pushReplacementNamed(BabyInfoScreenViewDoctor.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: milkyClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInDoctor(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: SizedBox(
          height: MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: const ImageAndBorderOfBabyInDoctor()),
    );
  }
}

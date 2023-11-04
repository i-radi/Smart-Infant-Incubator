import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets.dart/baby_info_scroll_page.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../widgets.dart/circulebutton.dart';
import '../../../widgets.dart/details_of_call_dialog.dart';
import '../../../widgets.dart/pop_up_menu.dart';
import '../../../widgets.dart/widgetsforbabyinfopage.dart';
import '../../../views/nurse_views/nurse_screens/control_incubator_in_nurse_screen.dart';
import '../../../views/nurse_views/nurse_screens/cry_analysis_screen_view_nurse.dart';
import 'package:final_project/style/color.dart';

class BabyInfoScreenDetailsInNurse extends StatelessWidget {
  const BabyInfoScreenDetailsInNurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          borderOfBabyPage(
            context,
            Padding(
                padding: EdgeInsets.only(top: 85.h, bottom: 5.h),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    floatingActionButton: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        circuleButtonWithNavigator(
                          context,
                          const ControlIncubatorInNurseScreen(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                iconSvgBuild(
                                    'assets/image/control.svg', Colors.black),
                              ]),
                          iconOfNurseClr,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        popUpMenu(
                            context,
                            motherDetails(iconOfNurseClr),
                            iconOfNurseClr,
                            'Mother',
                            'Doctor',
                            nurseAndDoctorDetails(context, 'Doctor Name',
                                'assets/image/doctor1.jpg', iconOfNurseClr)),
                      ],
                    ),
                    body: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: babyscreenScrollPage(context, borderOfNurseClr,
                          iconOfNurseClr, const CryAnalysisScreenViewNurse()),
                    ))),
            borderOfNurseClr,
            pageOfNurseClr,
          ),
          babyImage(context),
        ],
      ),
    );
  }
}

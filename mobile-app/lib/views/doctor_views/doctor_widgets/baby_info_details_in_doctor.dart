import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets.dart/details_of_call_dialog.dart';
import '../../../widgets.dart/pop_up_menu.dart';
import '../../../widgets.dart/widgetsforbabyinfopage.dart';
import '../../../widgets.dart/circulebutton.dart';
import '../../../widgets.dart/baby_info_scroll_page.dart';
import '../../../views/doctor_views/doctor_screens/control_incubator_screen.dart';
import 'package:final_project/style/color.dart';
import '../../../views/doctor_views/doctor_screens/cry_analysis_screen_view.dart';

class BabyInfoDetailsInDoctor extends StatelessWidget {
  const BabyInfoDetailsInDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 85.h, bottom: 5.h),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                circuleButtonWithNavigator(
                  context,
                  const ControlIncubatorScreen(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    iconSvgBuild('assets/image/control.svg', Colors.black),
                  ]),
                  milkyClr,
                ),
                SizedBox(
                  height: 8.h,
                ),
                popUpMenu(
                    context,
                    motherDetails(milkyClr),
                    milkyClr,
                    'Mother',
                    'Nurse',
                    nurseAndDoctorDetails(context, 'Nurse Name',
                        'assets/image/nurse5.jpg', milkyClr)),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: babyscreenScrollPage(
                  context,
                  borderOfDocPageClr.withOpacity(0.3),
                  milkyClr,
                  const CryAnalysisScreenViewDoctor()),
            )));
  }
}

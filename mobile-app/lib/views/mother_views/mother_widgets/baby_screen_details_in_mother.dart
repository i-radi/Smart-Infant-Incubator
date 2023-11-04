import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets.dart/details_of_call_dialog.dart';
import '../../../../widgets.dart/pop_up_menu.dart';
import '../../../../widgets.dart/baby_info_scroll_page.dart';
import '../../../style/color.dart';
import '../mother_screens/cry_analysis_screen_view_mother.dart';

class BabyScreenDetailsInMother extends StatelessWidget {
  const BabyScreenDetailsInMother({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: popUpMenu(
            context,
            nurseAndDoctorDetails(context, 'Doctor Name',
                'assets/image/doctor1.jpg', iconOfMotherClr),
            iconOfMotherClr,
            'Doctor',
            'Nurse',
            nurseAndDoctorDetails(context, 'Nurse Name',
                'assets/image/nurse5.jpg', iconOfMotherClr)),
        body: Padding(
          padding: EdgeInsets.only(left: 15, top: 85.h, bottom: 8.h),
          child: babyscreenScrollPage(context, borderOfMotherClr,
              iconOfMotherClr, const CryAnalysisScreenViewMother()),
        ));
  }
}

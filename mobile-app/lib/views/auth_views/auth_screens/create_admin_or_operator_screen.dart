import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_up_of_admin_screen.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/container_of_gradiant_background.dart';
import '../../../widgets.dart/custom_elevated_button.dart';
import '/views/doctor_views/doctor_screens/doctor_screen.dart';
import '/views/mother_views/mother_screens/mother_screen.dart';
import '/views/nurse_views/nurse_screens/nurse_screen.dart';

class CreateAdminOrOperatorScreen extends StatelessWidget {
  
  static const namedRoute = '/creat-admin-or-operator-screen';
   CreateAdminOrOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ContainerOfGradientBackground(
      childd: Scaffold(
        backgroundColor: transparent,
        appBar: appBarForAuth(
            leadingImg: 'assets/image/backarrow.svg',
            onPressed: () {
              Navigator.of(context).pop();
            }),
        body: SingleChildScrollView(
          child: BorderOfAuth(
            chiled: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/image/babydrawer.svg',
                    color: black,
                    height: MediaQuery.of(context).size.height * 0.22, //220,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Create your account,',
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 30.sp, color: black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'You will log in as',
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 30.sp, color: black),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  WideCustomElevatedButtonInSignUp(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignUpOfAdminScreen.namedRoute);
                    },
                    title: 'Administrator',
                    titleClr: black,
                    buttonClr: white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025, //15,
                  ),
                  WideCustomElevatedButtonInSignUp(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignUpOfAdminScreen.namedRoute);
                    },
                    title: 'Operator',
                    titleClr: black,
                    buttonClr: white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025, //15,
                  ),
                  WideCustomElevatedButtonInSignUp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(DoctorScreen.namedRoute);
                    },
                    title: 'Doctor',
                    titleClr: black,
                    buttonClr: white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025, //15,
                  ),
                  WideCustomElevatedButtonInSignUp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(NurseScreen.namedRoute);
                    },
                    title: 'Nurse',
                    titleClr: black,
                    buttonClr: white,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025, //15,
                  ),
                  WideCustomElevatedButtonInSignUp(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MotherScreen.namedRoute);
                    },
                    title: 'Mother',
                    titleClr: black,
                    buttonClr: white,
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025, //15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

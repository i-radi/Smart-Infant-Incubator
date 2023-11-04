import 'package:final_project/view_model/user_login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//doctor
import 'package:final_project/views/doctor_views/doctor_screens/baby_info_screen_view.dart';
import 'package:final_project/views/doctor_views/doctor_screens/baby_list_screen_view.dart';
import 'package:final_project/views/doctor_views/doctor_screens/control_incubator_screen.dart';
import 'package:final_project/views/doctor_views/doctor_screens/cry_analysis_screen_view.dart';
import 'package:final_project/views/doctor_views/doctor_screens/doctor_screen.dart';
import 'package:final_project/views/doctor_views/doctor_screens/notification_in_doctor_screen.dart';
import 'package:final_project/views/doctor_views/doctor_screens/nurse_list_screen_view.dart';
import 'package:final_project/views/doctor_views/doctor_screens/nurse_profile_in_doctor_screen.dart';
import 'package:provider/provider.dart';
import 'views/doctor_views/doctor_screens/admin_in_doctor_screen.dart';

//admin

import 'package:final_project/views/admin_views/admin_screens/admin_screen.dart';
import 'package:final_project/views/admin_views/admin_screens/baby_information_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/baby_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/doctor_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/nurse_list_screen_view_admin.dart';
import 'package:final_project/views/admin_views/admin_screens/operator_list_admin.dart';
import 'views/admin_views/admin_screens/baby_info_in_admin_screen.dart';
import 'views/admin_views/admin_screens/doctor_info_in_admin_scareen.dart';
import 'views/admin_views/admin_screens/doctor_profile_in_admin_screen.dart';
import 'views/admin_views/admin_screens/notification_in_admin_screen.dart';
import 'views/admin_views/admin_screens/nurse_info_in_admin_screen.dart';
import 'views/admin_views/admin_screens/nuse_profile_in_admin_screen.dart';
import 'views/admin_views/admin_screens/operator_info_in_admin_screen.dart';
import 'views/admin_views/admin_screens/operator_profile_in_admin_screen.dart';

//auth
import 'views/auth_views/auth_screens/sign_up_of_admin_screen.dart';
import 'views/auth_views/auth_screens/create_admin_or_operator_screen.dart';
import 'package:final_project/views/auth_views/auth_screens/login_screen.dart';
import 'views/auth_views/auth_screens/image_and_hospital_details_for_admin_in_auth_screen.dart';
import 'views/auth_views/auth_screens/verification_screen.dart';

//mother
import 'views/mother_views/mother_screens/doctor_profile_in_mother.dart';
import 'views/mother_views/mother_screens/nurse_profile_in_mother.dart';
import 'views/mother_views/mother_screens/baby_list_screen_mother.dart';
import 'views/mother_views/mother_screens/baby_screen_view_mother.dart';
import 'views/mother_views/mother_screens/cry_analysis_screen_view_mother.dart';
import 'views/mother_views/mother_screens/mother_screen.dart';
//nurse
import 'views/nurse_views/nurse_screens/admin_in_nurse_screen.dart';
import 'views/nurse_views/nurse_screens/baby_info_screen_view_nurse.dart';
import 'views/nurse_views/nurse_screens/control_incubator_in_nurse_screen.dart';
import 'views/nurse_views/nurse_screens/doctor_profile_in_nurse_screen.dart';
import 'views/nurse_views/nurse_screens/notification_in_nurse_screen.dart';
import 'package:final_project/views/nurse_views/nurse_screens/baby_list_screen_view_nurse.dart';
import 'package:final_project/views/nurse_views/nurse_screens/cry_analysis_screen_view_nurse.dart';
import 'package:final_project/views/nurse_views/nurse_screens/doctor_list_screen_view_nurse.dart';
import 'package:final_project/views/nurse_views/nurse_screens/nurse_screen.dart';
//operator
import 'package:final_project/views/operator_views/operator_screens/baby_information_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/baby_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/doctor_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/nurse_list_screen_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/operator_screen.dart';
import 'views/operator_views/operator_screens/admin_in_operator_screen.dart';
import 'views/operator_views/operator_screens/baby_info_in_operator_screen.dart';
import 'views/operator_views/operator_screens/doctor_info_in_operator_screen.dart';
import 'views/operator_views/operator_screens/doctor_profile_in_operator_screen.dart';
import 'views/operator_views/operator_screens/notification_in_operator_screen.dart';
import 'views/operator_views/operator_screens/nurse_info_in_operator_screen.dart';
import 'views/operator_views/operator_screens/nurse_profile_in_operator_screen.dart';
import 'views/operator_views/operator_screens/operator_profile_in_operator_screen.dart';
import 'views/operator_views/operator_screens/operators_list_in_operator_screen.dart';

  void main() {
  runApp(const MyApp()
   );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  get ctx => null;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [ChangeNotifierProvider(create:(context) => ProviderAuth()),],
      child: ScreenUtilInit(
          designSize: const Size(360, 640),
          minTextAdapt: true,
          builder: () {
            return MaterialApp(
              // theme: ThemeData(inputDecorationTheme: ),
              debugShowCheckedModeBanner: false,
              home:  LoginScreen(),
              routes: {
                SignUpOfAdminScreen.namedRoute: (ctx) =>
                    const SignUpOfAdminScreen(),
               
                CreateAdminOrOperatorScreen.namedRoute: (ctx) =>
                     CreateAdminOrOperatorScreen(),
                ImageAndHospitalDetailsForAdminInAuthScreen.namedRoute: (ctx) =>
                    const ImageAndHospitalDetailsForAdminInAuthScreen(),

                VerificationScreen.namedRoute: (ctx) =>
                    const VerificationScreen(),
                //doctor
                DoctorScreen.namedRoute: (ctx) => const DoctorScreen(),
    
                NotificationInDoctorScreen.namedRoute: (ctx) =>
                    const NotificationInDoctorScreen(),
                AdminInDoctorScreen.namedRoute: (ctx) =>
                    const AdminInDoctorScreen(),
                BabyListScreenViewDoctor.namedRoute: (ctx) =>
                    const BabyListScreenViewDoctor(),
                NurseListScreenViewDoctor.namedRoute: (ctx) =>
                    const NurseListScreenViewDoctor(),
                NurseProfileInDoctorScreen.namedRoute: (ctx) =>
                    const NurseProfileInDoctorScreen(),
                BabyInfoScreenViewDoctor.namedRoute: (ctx) =>
                    const BabyInfoScreenViewDoctor(),
                ControlIncubatorScreen.namedRoute: (ctx) =>
                    const ControlIncubatorScreen(),
                CryAnalysisScreenViewDoctor.namedRoute: (ctx) =>
                    const CryAnalysisScreenViewDoctor(),
                //mother
                MotherScreen.namedRoute: (ctx) => const MotherScreen(),
    
                DoctorProfileInMother.namedRoute: (ctx) =>
                    const DoctorProfileInMother(),
                NurseProfileInMother.namedRoute: (ctx) =>
                    const NurseProfileInMother(),
                BabyScreenViewMother.namedRoute: (ctx) =>
                    const BabyScreenViewMother(),
                CryAnalysisScreenViewMother.namedRoute: (ctx) =>
                    const CryAnalysisScreenViewMother(),
                BabyListScreenMother.namedRoute: (ctx) =>
                    const BabyListScreenMother(),
                //admin
                // AdminScreen.namedRoute: (ctx) =>  AdminScreen(user:A ,),
                OperatorProfileInAdminScreen.namedRoute: (ctx) =>
                    const OperatorProfileInAdminScreen(),
                DoctorProfileInAdminScreen.namedRoute: (ctx) =>
                    const DoctorProfileInAdminScreen(),
                NurseProfileInAdminScreen.namedRoute: (ctx) =>
                    const NurseProfileInAdminScreen(),
                NotificationInAdminScreen.namedRoute: (ctx) =>
                    const NotificationInAdminScreen(),
                OperatorInfoInAdminScreen.namedRoute: (ctx) =>
                    const OperatorInfoInAdminScreen(),
                DoctorInfoInAdminScreen.namedRoute: (ctx) =>
                    const DoctorInfoInAdminScreen(),
                NurseInfoInAdminScreen.namedRoute: (ctx) =>
                    const NurseInfoInAdminScreen(),
                BabyInfoInAdminScreen.namedRoute: (ctx) =>
                    const BabyInfoInAdminScreen(),
                BabyInformationViewAdmin.namedRoute: (ctx) =>
                    const BabyInformationViewAdmin(),
                BabyListScreenViewAdmin.namedRoute: (ctx) =>
                    const BabyListScreenViewAdmin(),
                DoctorListScreenViewAdmin.namedRoute: (ctx) =>
                    const DoctorListScreenViewAdmin(),
                NurseListScreenViewAdmin.namedRoute: (ctx) =>
                    const NurseListScreenViewAdmin(),
                OperatorListInAdminScreen.namedRoute: (ctx) =>
                    const OperatorListInAdminScreen(),
                //operator
                OperatorScreen.namedRoute: (ctx) => const OperatorScreen(),
                NotificationInOperatorScreen.namedRoute: (ctx) =>
                    const NotificationInOperatorScreen(),
                AdminInOperatorScreen.namedRoute: (ctx) =>
                    const AdminInOperatorScreen(),
                OperatorListInOperatorScreen.namedRoute: (ctx) =>
                    const OperatorListInOperatorScreen(),
                OperatorInOperatorScreen.namedRoute: (ctx) =>
                    const OperatorInOperatorScreen(),
                DoctorProfileInOperatorScreen.namedRoute: (ctx) =>
                    const DoctorProfileInOperatorScreen(),
                NurseProfileInOperatorScreen.namedRoute: (ctx) =>
                    const NurseProfileInOperatorScreen(),
                DoctorInfoInOperatorScreen.namedRoute: (ctx) =>
                    const DoctorInfoInOperatorScreen(),
                NurseInfoInOperatorScreen.namedRoute: (ctx) =>
                    const NurseInfoInOperatorScreen(),
                DoctorListScreenViewOperator.namedRoute: (ctx) =>
                    const DoctorListScreenViewOperator(),
                NurseListScreenViewOperator.namedRoute: (ctx) =>
                    const NurseListScreenViewOperator(),
                BabyListScreenViewOperator.namedRoute: (ctx) =>
                    const BabyListScreenViewOperator(),
                BabyInformationViewOperator.namedRoute: (ctx) =>
                    const BabyInformationViewOperator(),
                BabyInfoInOperatorScreen.namedRoute: (ctx) =>
                    const BabyInfoInOperatorScreen(),
                //nurse
                NurseScreen.namedRoute: (ctx) => const NurseScreen(),
    
                NotificationInNurseScreen.namedRoute: (ctx) =>
                    const NotificationInNurseScreen(),
                AdminInNurseScreen.namedRoute: (ctx) =>
                    const AdminInNurseScreen(),
                DoctorListScreenViewNurse.namedRoute: (ctx) =>
                    const DoctorListScreenViewNurse(),
                DoctorProfileInNurseScreen.namedRoute: (ctx) =>
                    const DoctorProfileInNurseScreen(),
                BabyListScreenViewNurse.namedRoute: (ctx) =>
                    const BabyListScreenViewNurse(),
                ControlIncubatorInNurseScreen.namedRoute: (ctx) =>
                    const ControlIncubatorInNurseScreen(),
                CryAnalysisScreenViewNurse.namedRoute: (ctx) =>
                    const CryAnalysisScreenViewNurse(),
                BabyInfoScreenViewNurse.namedRoute: (ctx) =>
                    const BabyInfoScreenViewNurse(),
              },
            );
          }),
    );
  }
}

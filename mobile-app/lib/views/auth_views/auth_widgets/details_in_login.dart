import 'package:final_project/providers/auth/auth_provider.dart';
import 'package:final_project/repository/validations.dart';
import 'package:final_project/views/admin_views/admin_screens/admin_screen.dart';
import 'package:final_project/views/auth_views/auth_screens/create_admin_or_operator_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../enums.dart';
import '../auth_screens/verification_screen.dart';
import '../../../../widgets.dart/text_button.dart';
import '../../../../widgets.dart/title_above_form_field.dart';
import '../../../../widgets.dart/wide_button.dart';

class DetailsInLogin extends StatelessWidget {
   DetailsInLogin({Key? key}) : super(key: key);


  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final read = context.read<AuthProvider>();
    final watch = context.watch<AuthProvider>();
     if(watch.state==AppState.loading){
      return const Center(child: CircularProgressIndicator(),);
    }
    return Form(
      key: _loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 40.h,
          ),
          TitleAboveFormFieldForLogIn(
            title: 'E-mail',
            onChange: read.setEmail,
            validation: AuthValidation.emailValidation,
          ),
          TitleAboveFormFieldForLogIn(
            title: 'password',
          onChange: read.setPassword,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter the password';
              }
              return null;
            },
            sufIcon: watch.isObsecure ? Icons.visibility : Icons.visibility_off,
            obsocure: watch.isObsecure,
            onPressed: 
            read.changeVisability
            ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: TextButtonInLogin(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(VerificationScreen.namedRoute);
                },
                title: 'forgot password'),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: WideClickableContainerWithGradient(
                onPressed: () async{
                                       await read.loging().then((_) {  if(watch.state==AppState.error){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('something went wrong')));
                }else{
                  print(watch.auth);
                 Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AdminScreen(
                        user: watch.auth!,
                      ),));
                }});

              
                 // EmployeeRepo.employeeInastance.getEmployee();

                 //  UserRepo.userInstance.getUser();
                },
              )),
          SizedBox(
            height: 5.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Dont\'t have an account?',
              textScaleFactor: 1,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            TextButtonInLogin(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(CreateAdminOrOperatorScreen.namedRoute);
                },
                title: 'sign up')
          ]),
        ],
      ),
    );
  }
}

/*  
      if(AuthRepo.authInstance.authentication.email.contains('admin')){
         Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
        }else if (AuthRepo.authInstance.authentication.email.contains('op')) {
          Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
        }else if (AuthRepo.authInstance.authentication.email.contains('doc')) {
           Navigator.of(context).pushReplacementNamed(DoctorScreen.namedRoute);
        }else if (AuthRepo.authInstance.authentication.email.contains('nrs')) {
           Navigator.of(context).pushReplacementNamed(NurseScreen.namedRoute);
        }else if (AuthRepo.authInstance.authentication.email.contains('mom')) {
           Navigator.of(context).pushReplacementNamed(MotherScreen.namedRoute);
        }




         Provider.of<ProviderAuth>(context, listen: false)
          .getLoginData(_emailController.text, _passwordController.text)
          .then((value) {
        if (value['error'] != null) {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    child: Text(value['error']),
                  ));
        } else {print(value);}
      }); 

    
    */

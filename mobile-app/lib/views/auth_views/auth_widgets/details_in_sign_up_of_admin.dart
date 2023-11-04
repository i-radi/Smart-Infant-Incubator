import 'dart:developer';
import 'package:final_project/enums.dart';
import 'package:final_project/providers/auth/auth_provider.dart';
import 'package:final_project/repository/validations.dart';
import 'package:provider/provider.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:final_project/repository/user_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '/views/auth_views/auth_screens/image_and_hospital_details_for_admin_in_auth_screen.dart';
import '/widgets.dart/custom_elevated_button.dart';
import '/widgets.dart/title_above_form_field.dart';

class DetailsInSignUpOfAdmin extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   DetailsInSignUpOfAdmin({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AuthProvider  watch = context.watch<AuthProvider>(); 
    final AuthProvider read = context.read<AuthProvider>(); 
    if(watch.state==AppState.loading){
      return const Center(child: CircularProgressIndicator(),);
    }
    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        
        children: [
          SizedBox(height: 4.h,),
          Expanded(
            child: ListView(
              children: [
                TitleAboveTextFormFieldForSignUp(
                  title: 'Name',
                  onChanged: read.setName,
              
                  keyBoardType: TextInputType.multiline,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your name';
                    } else {
                      return null;
                    }
                  },
                ),
                TitleAboveTextFormFieldForSignUp(
                  title: 'User name',
                 onChanged: read.setUserName,
                  keyBoardType: TextInputType.multiline,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'please enter the user name';
                    } else {
                      return null;
                    }
                  },
                ),
                TitleAboveTextFormFieldForSignUp(
                  title: 'E-mail',
                  onChanged: read.setEmail,
                  keyBoardType: TextInputType.emailAddress,
                  validation: AuthValidation.emailValidation,
                    
                
                ),
                TitleAboveTextFormFieldForSignUp(
                  title: 'Password',
                 onChanged: read.setPassword,
                  keyBoardType: TextInputType.multiline,
                  validation: AuthValidation.passwordValidation,
                  
                ),
                TitleAboveTextFormFieldForSignUp(
                  title: 'Repeat Password',
                  //onChanged: read.setEmail,
                  keyBoardType: TextInputType.multiline,
                  validation: (value) {
                    if(AuthValidation.confirmPassword(watch.password, value!)){
                      return null;

                    }return 'password is not match';
                  }
                    
                   
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TitleAboveTextFormFieldForSignUp(
                    title: 'Phone number',
                   
                    keyBoardType: TextInputType.number,
                    validation: (value) {
                      // if (value!.isEmpty) {
                      //   return 'please enter the phone number';
                      // }
                      // if (value.length < 11) {
                      //   return 'should be at least 11 characters';
                      // } else {
                      //   return null;
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 7.h),
            child: WideCustomElevatedButtonInSignUp(
                onPressed: ()async{
                  if(formkey.currentState!.validate()) {
                    
                await read.signUp();
                if(watch.state==AppState.error){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('something went wrong')));
                }else{
                                  Navigator.of(context).pushNamed( ImageAndHospitalDetailsForAdminInAuthScreen.namedRoute);

                }
                  }
                  
                },
                title: 'Sign up'),
          )
        ],
      ),
    );
  }
}

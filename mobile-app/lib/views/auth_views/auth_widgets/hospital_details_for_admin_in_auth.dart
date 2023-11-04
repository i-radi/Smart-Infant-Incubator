
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets.dart/title_above_form_field.dart';
import '/widgets.dart/custom_elevated_button.dart';

class HospitalDetailsForAdminInAuth extends StatefulWidget {
  const HospitalDetailsForAdminInAuth({Key? key}) : super(key: key);

  @override
  _HospitalDetailsForAdminInAuthState createState() =>
      _HospitalDetailsForAdminInAuthState();
}

class _HospitalDetailsForAdminInAuthState
    extends State<HospitalDetailsForAdminInAuth> {
  final _hospitalNumberController = TextEditingController();
  final _hospitalNameContrroler = TextEditingController();

  final GlobalKey<FormState> _formmKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _hospitalNumberController.dispose();
    _hospitalNameContrroler.dispose();
    super.dispose();
  }

  void _saveForm() async{
    final isValide = _formmKey.currentState!.validate();
    if (!isValide) {
      return;
    } else {

  // final HospitalInfo? _hospitalModel =await HospitalRepo.hospitelInstance.postHospital(name: _hospitalNameContrroler.text, phone: _hospitalNumberController.text);
  
    
  //  if (_hospitalModel == null){

  //    log('error occured');

  //  }else{

  //   log(_hospitalModel.name);
  //   log(_hospitalModel.id);
  //   Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
  //  }


    }
    _formmKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formmKey,
      child: Column(
        children: [
          TitleAboveTextFormFieldForSignUp(
            title: 'Hospital number',
            controller: _hospitalNumberController,
            onSaved: (val) {
              _hospitalNumberController.text = val!;
            },
            keyBoardType: TextInputType.number,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter the phone number';
              } else {
                return null;
              }
            },
          ),
          TitleAboveTextFormFieldForSignUp(
            title: 'Hospital name',
            controller: _hospitalNameContrroler,
            onSaved: (val) {
              _hospitalNameContrroler.text = val!;
            },
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter the hospital name';
              } else {
                return null;
              }
            },
            keyBoardType: TextInputType.multiline,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.077,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, bottom: 7.h, top: 50.h),
            child: WideCustomElevatedButtonInSignUp(
                onPressed: () {
                  
                   _saveForm();
                 //  Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
                // HospitalRepo.hospitelInstance.getHospital();
                 
                },
                title: 'Done'),
          ),
        ],
      ),
    );
  }
}

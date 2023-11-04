import 'package:final_project/views/operator_views/operator_screens/baby_list_screen_view_operator.dart';
import 'package:final_project/widgets.dart/circular_button.dart';
import 'package:final_project/widgets.dart/date_packer.dart';
import 'package:final_project/widgets.dart/drop_down_menu.dart';
import 'package:final_project/widgets.dart/title_besides_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormFieldOfBabayInOperator extends StatefulWidget {
  const FormFieldOfBabayInOperator({Key? key}) : super(key: key);

  @override
  _FormFieldOfBabayInOperatorState createState() =>
      _FormFieldOfBabayInOperatorState();
}

class _FormFieldOfBabayInOperatorState
    extends State<FormFieldOfBabayInOperator> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedValue;

  final List<String> doctorsItems = [
    'dr.name1',
    'dr.name4',
    'dr.name3',
  ];
  String? selecteddoctorValue;

  final List<String> nurseItems = [
    ' nurse name1',
    'nurse name4',
    'nurse name3',
  ];
  String? selectednurseValue;

  final TextEditingController _babyCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _babyCodeController.dispose();
    _passwordController.dispose();
    _motherNameController.dispose();
    _birthDateController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValide = _formKey.currentState?.validate();
   if (!isValide!) {
      return;
    } else {
      Navigator.of(context).pushReplacementNamed(BabyListScreenViewOperator.namedRoute);
    }

    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TitleBesidesTextForm(
            title: 'Baby Code',
            controller: _babyCodeController,
            onSaved: (val) {
              _babyCodeController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter baby code';
              } else {
                return null;
              }
            },
          ),
          TextWithFormFieldWithDropDownBytton(
            title: 'Gender',
            hint: 'Select Your Gender',
            icon: Icons.expand_more,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            items: genderItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
              return null;
            },
          ),
          TextWithFormFieldWithDropDownBytton(
            title: 'Doctor',
            hint: 'Select the doctor',
            icon: Icons.expand_more,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            items: doctorsItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select doctor';
              }
              return null;
            },
          ),
          TextWithFormFieldWithDropDownBytton(
            title: 'Nurse',
            hint: 'Select the nurse',
            icon: Icons.expand_more,
            onSaved: (value) {
              selectedValue = value.toString();
            },
            items: nurseItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select nurse.';
              }
              return null;
            },
          ),
          TitleBesidesTextForm(
            title: 'Mother user name',
            controller: _motherNameController,
            onSaved: (val) {
              _motherNameController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter mother user name';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'Password',
            controller: _passwordController,
            onSaved: (val) {
              _passwordController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter the password';
              }
              if (value.length < 8) {
                return 'should be at least 8 characters';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'Birth date',
            controller: _birthDateController,
            onSaved: (val) {
              _birthDateController.text = val!;
            },
            readOnly: true,
            // keyBoardType: TextInputType.number,
            icon: Icons.calendar_today_outlined,
            hint: _birthDateController.text,
            onPressed: () {
              datePaker(context, (selected) {
                setState(() {
                  _birthDateController.text = DateFormat('dd-MM-yyyy').format(selected).toString();
                });
              });
            },
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter birth date';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'mother Number',
            controller: _phoneNumberController,
            onSaved: (val) {
              _phoneNumberController.text = val!;
            },
            keyBoardType: TextInputType.number,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter phone number';
              }
              if (value.length < 11) {
                return 'should be at least 11 characters';
              } else {
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Align(
              alignment: Alignment.bottomRight,
              child: buildCirculerButtonInInformationPage(
                  'assets/image/save.svg', () {
                _saveForm();
              }),
            ),
          ),
        ],
      ),
    );
  }
}

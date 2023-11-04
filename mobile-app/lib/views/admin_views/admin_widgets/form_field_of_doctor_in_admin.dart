import 'package:final_project/views/admin_views/admin_screens/doctor_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../../../../widgets.dart/circular_button.dart';
import '../../../style/color.dart';
import '../../../../widgets.dart/title_besides_form_field.dart';

class FormFieldOfDoctorInAdmin extends StatefulWidget {
  const FormFieldOfDoctorInAdmin({Key? key}) : super(key: key);

  @override
  _FormFieldOfDoctorInAdminState createState() =>
      _FormFieldOfDoctorInAdminState();
}

class _FormFieldOfDoctorInAdminState extends State<FormFieldOfDoctorInAdmin> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _dayOfBirthDateController =
      TextEditingController();
  final TextEditingController _monthOfBirthDateController =
      TextEditingController();
  final TextEditingController _yearOfBirthDateController =
      TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _degreeOfPromotionController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _universityController.dispose();
    _birthDateController.dispose();
    _dayOfBirthDateController.dispose();
    _monthOfBirthDateController.dispose();
    _yearOfBirthDateController.dispose();
    _nationalIdController.dispose();
    _degreeOfPromotionController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool expanded = false;

  void _saveForm() {
    final isValide = _formKey.currentState?.validate();
    if (!isValide!) {
      return;
    } else {
      Navigator.of(context).pushReplacementNamed(DoctorListScreenViewAdmin.namedRoute);
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
            title: 'User Name',
            controller: _userNameController,
            onSaved: (val) {
              _userNameController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter user name';
              } else {
                return null;
              }
            }
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
            title: 'Name',
            controller: _nameController,
            onSaved: (val) {
              _nameController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter your name';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'E-mail address',
            controller: _emailController,
            onSaved: (val) {
              _emailController.text = val!;
            },
            hint: 'optinal',
            hintStyle: hintClr,
            keyBoardType: TextInputType.emailAddress,
          ),
          TitleBesidesTextForm(
            title: 'University',
            controller: _universityController,
            onSaved: (val) {
              _universityController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter your university';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesRowTextField(title: 'Birth date', textFields: [
            RowTextFormField(
              controller: _dayOfBirthDateController,
              onSavedd: (val) {
                _dayOfBirthDateController.text = val!;
              },
              validationn: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
            ),
            RowTextFormField(
              controller: _monthOfBirthDateController,
              onSavedd: (val) {
                _monthOfBirthDateController.text = val!;
              },
              validationn: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
            ),
            RowTextFormField(
              flex: 2,
              controller: _yearOfBirthDateController,
              onSavedd: (val) {
                _yearOfBirthDateController.text = val!;
              },
              validationn: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
            ),
          ]),
          TitleBesidesTextForm(
            title: 'National ID',
            controller: _nationalIdController,
            onSaved: (val) {
              _nationalIdController.text = val!;
            },
            keyBoardType: TextInputType.multiline,
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter national ID';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'Degree of promotion',
            controller: _degreeOfPromotionController,
            onSaved: (val) {
              _degreeOfPromotionController.text = val!;
            },
            
            keyBoardType: TextInputType.multiline,
            onPressed: () {},
            validation: (value) {
              if (value!.isEmpty) {
                return 'please enter degree of promotion';
              } else {
                return null;
              }
            },
          ),
          TitleBesidesTextForm(
            title: 'Phone Number',
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

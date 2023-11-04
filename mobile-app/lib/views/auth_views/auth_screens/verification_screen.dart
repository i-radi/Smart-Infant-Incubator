import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/title_above_form_field.dart';
import '../../../widgets.dart/wide_button.dart';
import '../../../widgets.dart/paint_traingle.dart';

class VerificationScreen extends StatefulWidget {
  static const namedRoute = '/verification-screen';
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _verificationController = TextEditingController();
  final GlobalKey<FormState> _formVelKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _verificationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValide = _formVelKey.currentState!.validate();
    if (!isValide) {
      return;
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: transparent,
      appBar: appBarForAuth(
          leadingImg: 'assets/image/backarrow.svg',
          onPressed: () {
            Navigator.of(context).pop();
          }),
      body: Form(
        key: _formVelKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  if (_focusNode.hasFocus)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 13,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.77,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: iconOfAdminClr),
                                borderRadius: BorderRadius.circular(5),
                                color: white),
                            child: Text(
                              'Enter your E-mail or phone number to send you code then reset your password',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  color: wideButtonClr, fontSize: 14.sp),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                          ),
                          child: SizedBox(
                            height: 10,
                            width: 40,
                            child: CustomPaint(
                              foregroundPainter: MyTrianglePainter(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Positioned(
                    //  bottom: 10,
                    top: 70,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: CustomTextFormFieldForSignUp(
                        onChanged: (s){},
                        controller: _verificationController,
                        onSavedd: (val) {
                          _verificationController.text = val!;
                        },
                        validationn: (value) {
                          if (value!.isEmpty) {
                            return 'please enter the email or phone number';
                          } else {
                            return null;
                          }
                        },
                        hintTextt:
                            _focusNode.hasFocus ? '' : 'E-mail or Phone Number',
                        keyBordTybee: TextInputType.emailAddress,
                        focusNodee: _focusNode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7),
              child: WideButton(
                  onPressed: () {
                    setState(() {
                      _saveForm();
                    });
                  },
                  title: 'Next'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class TitleAboveTextFormFieldForSignUp extends StatelessWidget {
  const TitleAboveTextFormFieldForSignUp(
      {required this.title,
      this.controller,
       this.onSaved,
      this.readOnly,
      this.hint,
      this.hintStyle,
      this.icon,
      this.onPressed,
      this.keyBoardType,
      this.validation,
      Key? key, this.onChanged})
      : super(key: key);
  final String title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final bool? readOnly;
  final String? hint;
  final Color? hintStyle;
  final IconData? icon;
  final Function()? onPressed;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validation;
  final  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.h,
        left: 10.w,
        right: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              textScaleFactor: 1.2,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          CustomTextFormFieldForSignUp(
            onChanged: onChanged,
            controller: controller,
            onSavedd: onSaved,
            validationn: validation,
            keyBordTybee: keyBoardType,
          )
        ],
      ),
    );
  }
}

class CustomTextFormFieldForSignUp extends StatelessWidget {
  const CustomTextFormFieldForSignUp({
    Key? key,
     this.controller,
    this.onSavedd,
    this.iconn,
    this.onPressedd,
    this.hintTextt,
    this.hintStylee,
    this.keyBordTybee,
    this.validationn,
    this.readOnlyy,
    this.focusNodee,required this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String?)? onSavedd;
  final IconData? iconn;
  final Function()? onPressedd;
  final String? hintTextt;
  final Color? hintStylee;
  final TextInputType? keyBordTybee;
  final String? Function(String?)? validationn;
  final bool? readOnlyy;
  final FocusNode? focusNodee;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 18.sp,
      ),
      onChanged:onChanged ,
      cursorHeight: 25.h,
      focusNode: focusNodee,
      onSaved: onSavedd,
      controller: controller,
      cursorColor: iconOfAdminClr,
      readOnly: readOnlyy ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hintText: hintTextt,
        hintStyle: TextStyle(color: black.withOpacity(0.6)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: wideButtonClr, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: wideButtonClr, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: edtButtonClr, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: edtButtonClr, width: 0.5),
        ),
        suffixIcon: InkWell(
          onTap: () {
            if (onPressedd != null) {
              onPressedd!();
            }
          },
          child: Icon(
            iconn,
            color: iconOfAdminClr,
          ),
        ),
      ),
      keyboardType: keyBordTybee,
      validator: validationn,
    );
  }
}

//form field for login screen withot border

class TitleAboveFormFieldForLogIn extends StatelessWidget {
  const TitleAboveFormFieldForLogIn(
      {required this.title,
       this.controller,
       this.onSaved,
      this.sufIcon,
      this.onPressed,
      this.keyBoardType,
      required this.validation,
      this.obsocure,
      required this.onChange,
      Key? key})
      : super(key: key);

  final String title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;

  final IconData? sufIcon;
  final Function()? onPressed;
  final TextInputType? keyBoardType;
  final String? Function(String?) validation;
  final bool? obsocure;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: iconOfAdminClr),
          ),
          CustomTextFormFieldForLogIn(
            onChange: onChange,
            controller: controller,
            onSavedd: onSaved,
            validationn: validation,
            sufIconn: sufIcon,
            onPressedd: onPressed,
            obsocuree: obsocure,
          ),
        ],
      ),
    );
  }
}

class CustomTextFormFieldForLogIn extends StatelessWidget {
  const CustomTextFormFieldForLogIn({
    Key? key,
    this.controller,
     this.onSavedd,
    this.sufIconn,
    this.onPressedd,
    this.keyBordTybee,
    required this.validationn,
    this.obsocuree,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String?)? onSavedd;
  final IconData? sufIconn;
  final Function()? onPressedd;
  final TextInputType? keyBordTybee;
  final String? Function(String?) validationn;
  final bool? obsocuree;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 18.sp,
      ),
      onChanged: onChange,
      onSaved: onSavedd,
      controller: controller,
      obscureText: obsocuree ?? false,
      //obscuringCharacter: '●',
      cursorColor: iconOfAdminClr,
      cursorHeight: 25.h,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: iconOfAdminClr)),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: thirdTopClrs),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: thirdTopClrs)),
        constraints: BoxConstraints(maxHeight: 65.h, minHeight: 50.h),
        suffixIcon: InkWell(
          onTap: () {
            if (onPressedd != null) {
              onPressedd!();
            }
          },
          child: Icon(
            sufIconn,
            color: iconOfAdminClr,
          ),
        ),
      ),
      keyboardType: keyBordTybee,
      validator: validationn,
    );
  }
}

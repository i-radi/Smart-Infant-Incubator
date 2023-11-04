import 'package:final_project/style/color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleBesidesTextForm extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Function(String?) onSaved;
  final bool? readOnly;
  final String? hint;
  final Color? hintStyle;
  final IconData? icon;
  final Function()? onPressed;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validation;

  const TitleBesidesTextForm({
    Key? key,
    required this.title,
    required this.controller,
    required this.onSaved,
    this.readOnly,
    this.hint,
    this.hintStyle,
    this.icon,
    this.onPressed,
    this.keyBoardType,
    this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              title,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
            ),
          ),
          Flexible(
            flex: 5,
            child: CustomTextFormField(
              controller: controller,
              onSavedd: onSaved,
              hintTextt: hint,
              hintStylee: hintStyle,
              iconn: icon,
              onPressedd: onPressed,
              keyBordTybee: keyBoardType,
              validationn: validation,
              readOnlyy: readOnly,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.onSavedd,
    this.iconn,
    this.onPressedd,
    this.hintTextt,
    this.hintStylee,
    this.keyBordTybee,
    this.validationn,
    this.readOnlyy,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String?) onSavedd;
  final IconData? iconn;
  final Function()? onPressedd;
  final String? hintTextt;
  final Color? hintStylee;
  final TextInputType? keyBordTybee;
  final String? Function(String?)? validationn;
  final bool? readOnlyy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: TextFormField(
        cursorHeight: 22,
        onSaved: onSavedd,
        controller: controller,
        cursorColor: iconOfAdminClr,
        readOnly: readOnlyy ?? false,
        decoration: InputDecoration(
          isDense: true,
        
          contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 8.w),
          suffixIconConstraints: BoxConstraints(minHeight: 8.h),
        
          hintText: hintTextt,
          hintStyle: TextStyle(color: hintStylee),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: iconOfAdminClr, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: iconOfAdminClr, width: 0.5),
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
            child: Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: Icon(
                iconn,
                size: 20,
                color: iconOfAdminClr,
                
              ),
            ),
          ),
        ),
        keyboardType: keyBordTybee,
        validator: validationn,
      ),
    );
  }
}

//specially for more than one textFormField in one row

class TitleBesidesRowTextField extends StatelessWidget {
  final String title;
  final List<RowTextFormField> textFields;
  // final List<Widget>? width;
  const TitleBesidesRowTextField({
    Key? key,
    required this.title,
    required this.textFields,
    //  this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              title,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
            ),
          ),
          Flexible(
            flex: 5,
            child: Row(
              children: textFields,
            ),
          ),
        ],
      ),
    );
  }
}

class RowTextFormField extends StatelessWidget {
  const RowTextFormField({
    Key? key,
    required this.controller,
    required this.onSavedd,
    required this.validationn,
    this.flex = 1,
    // this.mask,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String?) onSavedd;
  final String? Function(String?)? validationn;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: TextFormField(
          cursorHeight: 22,
          controller: controller,
          onSaved: onSavedd,
          validator: validationn,
          cursorColor: iconOfAdminClr,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 8.w),
           // contentPadding: const EdgeInsets.all(5),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: iconOfAdminClr, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: iconOfAdminClr, width: 0.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: edtButtonClr, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: edtButtonClr, width: 0.5),
            ),
            
          ),
           keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}

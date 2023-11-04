import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithFormFieldWithDropDownBytton extends StatelessWidget {
  const TextWithFormFieldWithDropDownBytton({
    Key? key,
    required this.title,
    required this.items,
    required this.validator,
    required this.onSaved,
    this.hint,
    required this.icon,
    // required this.onTap,
  }) : super(key: key);

  final String title;

  final List<DropdownMenuItem<String>> items;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  final String? hint;
  final IconData? icon;
  // final Function()? onTap;
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
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w900),
            ),
          ),
          Flexible(
            flex: 5,
            child: FormFieldWithDropDownButton(
              itemss: items,
              validatorr: validator,
              onSavedd: onSaved,
              hintt: hint,
              iconn: icon,
              // onTapp: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class FormFieldWithDropDownButton extends StatelessWidget {
  const FormFieldWithDropDownButton({
    Key? key,
    required this.itemss,
    required this.validatorr,
    required this.onSavedd,
    this.hintt,
    required this.iconn,
    // required this.onTapp,
  }) : super(key: key);

  final List<DropdownMenuItem<String>> itemss;
  final String? Function(String?) validatorr;
  final Function(String?) onSavedd;
  final String? hintt;
  final IconData? iconn;
  // final Function()? onTapp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          
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
    
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(  borderRadius: BorderRadius.circular(15),  ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
        isExpanded: true,
        hint: Text(
          hintt ?? '',
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
        icon: Icon(
          iconn,
          color: iconOfAdminClr,
        ),
        iconSize: 25,
        buttonHeight: 47,
        buttonPadding:  EdgeInsets.symmetric(vertical: 5.h , horizontal: 8.w),
        items: itemss,
        validator: validatorr,
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: onSavedd,
        //  onTap: onTapp,
      ),
    );
  }
}

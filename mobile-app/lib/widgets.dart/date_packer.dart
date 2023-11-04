import 'package:flutter/material.dart';

//DateTime? selectedDate; //delete this

datePaker(BuildContext context, Function callBack) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2021),
    lastDate: DateTime.now(),
  ).then((packedDate) {
    if (packedDate == null) {
      return;
    } else {
      callBack(packedDate); // here pass packedDate to textEditingController
    }
  });
}


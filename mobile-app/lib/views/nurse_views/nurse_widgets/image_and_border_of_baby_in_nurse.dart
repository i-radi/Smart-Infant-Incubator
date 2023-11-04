import 'package:final_project/widgets.dart/babyimage.dart';
import 'package:final_project/widgets.dart/borderofbadypage.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';

import 'control_incubator_details_in_nurse.dart';

class ImageAndBorderOfBabyInNurse extends StatelessWidget {
  const ImageAndBorderOfBabyInNurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        borderOfBabyPage(
          context,
          const ControlIncubatorDetailsInNurse(),
          borderOfNurseClr,
          pageOfNurseClr,
        ),
        babyImage(context)
      ],
    );
  }
}

import 'package:final_project/widgets.dart/babyimage.dart';
import 'package:final_project/widgets.dart/borderofbadypage.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';

import 'control_incubator_details_in_doctor.dart';

class ImageAndBorderOfBabyInDoctor extends StatelessWidget {
  const ImageAndBorderOfBabyInDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          borderOfBabyPage(
            context,
            const ControlIncubatorDetailsInDoctor(),
            borderOfDocPageClr.withOpacity(0.3),
            pageOfDoctorsClr,
          ),
          babyImage(context)
        ],
      ),
    );
  }
}

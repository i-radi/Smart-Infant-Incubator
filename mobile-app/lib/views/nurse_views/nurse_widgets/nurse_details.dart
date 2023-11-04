import 'package:flutter/material.dart';

import '../../../style/color.dart';
import '/widgets.dart/lower_part_of_profil_page.dart';
import '/widgets.dart/upper_part_of_profile_page.dart';

class NurseDetails extends StatelessWidget {
  const NurseDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildUpperPart(
          backGroundImage: 'assets/image/nurse5.jpg',
          firstText: 'Nurse Name',
          secondText: 'Hospital Name',
          clrOfSecondText: iconOfNurseClr,
          thirdText: 'Edit',
          clrOfThirdText: edtButtonClr,
          functionOfTextButton: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BuildLowerPart(
                    text: 'User Name', widget: TxtWidget(textt: '●●●●●●●●')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Phone Number',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfNurseClr,
                ),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Email Address',
                  widget: TxtWidget(textt: 'johnDou@mail.com'),
                  icon: 'assets/image/message.svg',
                  colorOfIcon: iconOfNurseClr,
                ),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Hospital Numper',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfNurseClr,
                ),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Degree of promotion',
                    widget: TxtWidget(textt: 'consaltan')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Password', widget: TxtWidget(textt: '●●●●●●●●')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../style/color.dart';
import '/widgets.dart/lower_part_of_profil_page.dart';
import '/widgets.dart/upper_part_of_profile_page.dart';

class NurseDetailsInOperator extends StatelessWidget {
  const NurseDetailsInOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildUpperPart(
          backGroundImage: 'assets/image/nurse5.jpg',
          firstText: 'Nurse Name',
          secondText: 'Hospital Name',
          clrOfSecondText: iconOfAdminClr,
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
                    text: 'Spicialization',
                    widget: TxtWidget(textt: 'consaltant')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Degree of promotion',
                    widget: TxtWidget(textt: 'consaltant')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'National ID',
                    widget: TxtWidget(textt: '●●●●●●● ●●●●●')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Birth date', widget: TxtWidget(textt: '10-12-1979')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'University', widget: TxtWidget(textt: 'Alexandria')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Baby code',
                    widget: BuildContainerOfBabyCode(
                        text: 'Not yet', borserClr: iconOfAdminClr)),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'User Name', widget: TxtWidget(textt: '●●●●●●●●')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Password', widget: TxtWidget(textt: '●●●●●●●●')),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Phone Number',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfAdminClr,
                ),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Email Address',
                  widget: TxtWidget(textt: 'johnDou@mail.com'),
                  icon: 'assets/image/message.svg',
                  colorOfIcon: iconOfAdminClr,
                ),
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                  text: 'Hospital Numper',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfAdminClr,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

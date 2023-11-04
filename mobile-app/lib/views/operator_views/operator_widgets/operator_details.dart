import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/lower_part_of_profil_page.dart';
import 'package:final_project/widgets.dart/upper_part_of_profile_page.dart';
import 'package:flutter/material.dart';

class OperatorDetails extends StatelessWidget {
  const OperatorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildUpperPart(
          backGroundImage: 'assets/image/operator1.jpg',
          firstText: 'Operator Name',
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
                    text: 'User Name', widget: TxtWidget(textt: '●●●●●●●●')),
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
                Divider(
                  thickness: 0.5,
                ),
                BuildLowerPart(
                    text: 'Degree of promotion',
                    widget: TxtWidget(textt: 'consaltan')),
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

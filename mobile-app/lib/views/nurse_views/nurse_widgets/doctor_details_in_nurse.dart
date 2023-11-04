import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/lower_part_of_profil_page.dart';
import 'package:final_project/widgets.dart/upper_part_of_profile_page.dart';
import 'package:flutter/material.dart';

class DoctorDetailsInNurse extends StatelessWidget {
  const DoctorDetailsInNurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BuildUpperPart(
            backGroundImage: 'assets/image/doctor1.jpg',
            firstText: 'Doctor Name',
            secondText: 'Hospital Name',
            clrOfSecondText: iconOfNurseClr),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

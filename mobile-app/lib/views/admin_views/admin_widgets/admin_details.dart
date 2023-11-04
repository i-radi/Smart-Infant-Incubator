import 'package:final_project/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../style/color.dart';
import '../../../../widgets.dart/lower_part_of_profil_page.dart';
import '../../../../widgets.dart/upper_part_of_profile_page.dart';

class AdminDetails extends StatelessWidget {
  final Authentication user;
  const AdminDetails({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildUpperPart(
          backGroundImage: 'assets/image/administrator.jpg',
          firstText: user.username,
          secondText: 'Hospital Name',
          clrOfSecondText: iconOfAdminClr,
          thirdText: 'Edit',
          clrOfThirdText: edtButtonClr,
          functionOfTextButton: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 13.w, horizontal: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  [
                const BuildLowerPart(
                    text: 'User Name', widget: TxtWidget(textt: '●●●●●●●●')),
                const Divider(
                  thickness: 0.5,
                ),

                const BuildLowerPart(
                  text: 'Phone Number',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfAdminClr,
                ),
                const Divider(
                  thickness: 0.5,
                ),

                BuildLowerPart(
                  text: user.email,
                  widget: const TxtWidget(textt: 'johnDou@mail.com'),
                  icon: 'assets/image/message.svg',
                  colorOfIcon: iconOfAdminClr,
                ),
                const Divider(
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
                Divider(
                  thickness: 0.5,
                ),

                BuildLowerPart(
                    text: 'Password', widget: TxtWidget(textt: '●●●●●●●●')),

                // buildRow('Password', '●●●●●●●●', null),

                //buildRow(null, null, Icons.edit),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

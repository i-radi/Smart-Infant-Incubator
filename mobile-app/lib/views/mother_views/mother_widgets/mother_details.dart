import 'dart:io';

import 'package:final_project/widgets.dart/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../style/color.dart';
import '../../../../widgets.dart/lower_part_of_profil_page.dart';
import '../../../../widgets.dart/upper_part_of_profile_page.dart';

class MotherDetails extends StatefulWidget {
  const MotherDetails({Key? key}) : super(key: key);

  @override
  State<MotherDetails> createState() => _MotherDetailsState();
}

class _MotherDetailsState extends State<MotherDetails> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _storedImage = File(imageFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpperPartInMother(
          circuleOfImageWithButton: Stack(
            children: [
              CircleAvatar(
                foregroundImage: _storedImage != null
                    ? FileImage(
                        _storedImage!,
                      )
                    : null,
                backgroundColor: white,
                backgroundImage:
                    const AssetImage('assets/image/motherprofile.jpg'),
                radius: 60.h,
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.002, //0,
                right: MediaQuery.of(context).size.height * -0.035, //-20,
                child: SmallCirculerButtonWithPositon(
                    svgPath: _storedImage != null
                        ? 'assets/image/edit.svg'
                        : 'assets/image/add1.svg',
                    onPressed: () {
                      setState(() {
                        _takePicture();
                      });
                    },
                    borderOfButtonClr: iconOfMotherClr,
                    iconClr: iconOfMotherClr),
              ),
            ],
          ),
          firstText: 'Mother Name',
          secondText: 'Hospital Name',
          clrOfSecondText: iconOfMotherClr,
          thirdText: 'Edit',
          clrOfThirdText: edtButtonClr,
          functionOfTextButton: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const BuildLowerPart(
                    text: 'User Name', widget: TxtWidget(textt: '●●●●●●●●')),
                const Divider(
                  thickness: 1,
                ),
                const BuildLowerPart(
                  text: 'Phone Number',
                  widget: TxtWidget(textt: '●●●●●●●●●●●'),
                  icon: 'assets/image/call.svg',
                  colorOfIcon: iconOfMotherClr,
                ),
                const Divider(
                  thickness: 1,
                ),
                const BuildLowerPart(
                  text: 'Email Address',
                  widget: TxtWidget(textt: 'johnDou@mail.com'),
                  icon: 'assets/image/message.svg',
                  colorOfIcon: iconOfMotherClr,
                ),
                const Divider(
                  thickness: 1,
                ),
                BuildLowerPart(
                    text: 'Baby code',
                    widget: Column(
                      children: const [
                        BuildContainerOfBabyCode(
                            text: '●●●●●●', borserClr: iconOfMotherClr),
                        SizedBox(
                          height: 7,
                        ),
                        BuildContainerOfBabyCode(
                            text: '●●●●●●', borserClr: iconOfMotherClr),
                        SizedBox(
                          height: 7,
                        ),
                        BuildContainerOfBabyCode(
                            text: '●●●●●●', borserClr: iconOfMotherClr),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:final_project/widgets.dart/circular_button.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'hospital_details_for_admin_in_auth.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageDetailsForAdminInAuth extends StatefulWidget {
  const ImageDetailsForAdminInAuth({Key? key}) : super(key: key);

  @override
  _ImageDetailsForAdminInAuthState createState() =>
      _ImageDetailsForAdminInAuthState();
}

class _ImageDetailsForAdminInAuthState
    extends State<ImageDetailsForAdminInAuth> {
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
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: white,
                  foregroundColor: white,
                  foregroundImage: _storedImage != null
                      ? FileImage(
                          _storedImage!,
                        )
                      : null,
                  backgroundImage:
                      const AssetImage('assets/image/adminsinup.jpg'),
                  radius: MediaQuery.of(context).size.height * 0.11, //90,
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.001, //0,
                  right: MediaQuery.of(context).size.height * -0.028, //-20,
                  child: SmallCirculerButtonWithPositon(
                    svgPath: _storedImage != null
                        ? 'assets/image/edit.svg'
                        : 'assets/image/add1.svg',
                    onPressed: () {
                      setState(() {
                        _takePicture();
                      });
                    },
                    borderOfButtonClr: iconOfAdminClr,
                    iconClr: iconOfAdminClr,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'The photo must be from the back camera, clear, not from the side, and with a white background',
            textScaleFactor: 1.2,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.019,
        ),
        const HospitalDetailsForAdminInAuth(),
      ],
    );
  }
}

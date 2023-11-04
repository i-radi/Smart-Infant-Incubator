import 'dart:io';
import 'package:final_project/widgets.dart/circular_button.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/container_of_image_in_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ImageBoxOfNurseInOperator extends StatefulWidget {
  const ImageBoxOfNurseInOperator({Key? key}) : super(key: key);

  @override
  _ImageBoxOfNurseInOperatorState createState() =>
      _ImageBoxOfNurseInOperatorState();
}

class _ImageBoxOfNurseInOperatorState extends State<ImageBoxOfNurseInOperator> {
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
    return Stack(
      children: [
        buildContainerOfImage(
          context,
          _storedImage != null
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    image: DecorationImage(
                      image: FileImage(
                        _storedImage!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    'NO IMAGE TAKEN...',
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: iconOfAdminClr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
        ),
        Positioned(
         right: MediaQuery.of(context).size.width * 0.045,
         bottom: MediaQuery.of(context).size.height * 0.02,

            child: buildCirculerButtonInInformationPage(
                _storedImage != null
                    ? 'assets/image/edit.svg'
                    : 'assets/image/add1.svg',
                _takePicture)),
      ],
    );
  }
}

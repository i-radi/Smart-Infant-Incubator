import 'dart:io';
import 'package:final_project/views/admin_views/admin_screens/baby_list_screen_view_admin.dart';
import 'package:final_project/widgets.dart/circulebutton.dart';
import 'package:final_project/style/color.dart';
import 'package:final_project/widgets.dart/container_of_image_in_info.dart';
import 'package:final_project/widgets.dart/title_besides_form_field.dart';
import 'package:final_project/widgets.dart/widgetsforbabyinfopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class DetailsOfDialogForAddIncubatorInAdmin extends StatefulWidget {
  const DetailsOfDialogForAddIncubatorInAdmin({Key? key}) : super(key: key);

  @override
  _DetailsOfDialogForAddIncubatorInAdminState createState() =>
      _DetailsOfDialogForAddIncubatorInAdminState();
}

class _DetailsOfDialogForAddIncubatorInAdminState
    extends State<DetailsOfDialogForAddIncubatorInAdmin> {
  final _incuatorCodeController = TextEditingController();
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 117.h),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: iconOfAdminClr, width: 0.5),
              borderRadius: BorderRadius.circular(28),
              color: white),
          child: Column(
            children: [
              Stack(children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                  ],
                ),
                Positioned(
                    right: MediaQuery.of(context).size.width * 0.052,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                    child: CircleButtonForImageInImptyIncubator(
                      func: () {
                        _takePicture;
                      },
                      svgPath: _storedImage != null
                          ? 'assets/image/edit.svg'
                          : 'assets/image/add1.svg',
                    )),
              ]),
              Form(
                child: TitleBesidesTextForm(
                    title: 'Incubator code',
                    controller: _incuatorCodeController,
                    onSaved: (val) {
                      _incuatorCodeController.text = val!;
                    }),
              ),
              SizedBox(
                height: 65.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    circuleButtonWithNavigator(
                        context,
                        const BabyListScreenViewAdmin(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            iconSvgBuild(
                                'assets/image/save.svg', iconOfAdminClr),
                          ],
                        ),
                        iconOfAdminClr),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

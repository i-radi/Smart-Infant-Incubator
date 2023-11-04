import 'package:final_project/my_assets.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget babyImage(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.008,
      left: MediaQuery.of(context).size.width * 0.11,
      //right: MediaQuery.of(context).size.width * 0.08,
      //bottom: MediaQuery.of(context).size.height * 0.6,
    ),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width * 0.777,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        child: Image.asset(
          'assets/image/baby.jpg',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}

class ImageOfHandsWithPosition extends StatelessWidget {
  const ImageOfHandsWithPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //  right: MediaQuery.of(context).size.height  *0.06,
      // top: MediaQuery.of(context).size.height *0.62,

     left: MediaQuery.of(context).size.height  *-0.066 ,
     bottom: MediaQuery.of(context).size.height *-0.14,
      child: SvgPicture.asset(
        MyAssets.handSvg,
        color: iconOfAdminClr,
      ),
    );
  }
}

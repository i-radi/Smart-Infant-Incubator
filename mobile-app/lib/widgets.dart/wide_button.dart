import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class WideButton extends StatelessWidget {
  const WideButton(
      {required this.onPressed,
      required this.title,
      this.titleClr,
      this.buttonClr,
      Key? key})
      : super(key: key);
  final Function() onPressed;
  final String title;
  final Color? titleClr;
  final Color? buttonClr;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      height: 49.h,
      color: buttonClr ?? wideButtonClr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        textScaleFactor: 1.2,
        style: TextStyle(fontSize: 19.sp, color: titleClr ?? white),
      ),
    );
  }
}

class WideButtonWithGradientClr extends StatelessWidget {
  const WideButtonWithGradientClr({Key? key, required this.onPressed})
      : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      height: 40.h,
      padding: const EdgeInsets.all(0.0),
      // color: Colors.amber,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [firstLeftClrs, secondLeftClrs, thirdLeftClrs]),
          borderRadius: BorderRadius.circular(24),
        ),
        constraints:
            const BoxConstraints(maxHeight: 45, maxWidth: double.infinity),
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 8),
        child: Text(
          'Log in',
          textScaleFactor: 1,
          style: TextStyle(fontSize: 16.sp, color: white),
        ),
      ),
    );
  }
}





class WideClickableContainerWithGradient extends StatelessWidget {
  const WideClickableContainerWithGradient({ required this.onPressed, Key? key ,}) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: white,
      focusColor: white,
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(colors: [
           firstLeftClrs, secondLeftClrs, thirdLeftClrs
          ],),
         
          boxShadow: const [BoxShadow(
            color: shadowClr,
            offset: Offset(0 ,3),
            blurRadius: 6.0,
          ),
          ]

        ),
       
       child:  Center(
         child: Text(
            'Log in',
            textScaleFactor: 1,
            style: TextStyle(fontSize: 19.sp, color: white),
          ),
       ),


        
      ),
    );
  }
}


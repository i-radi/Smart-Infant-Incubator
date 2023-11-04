import 'package:flutter/material.dart';

import '../style/color.dart';

class ContainerOfGradientBackground extends StatelessWidget {
  const ContainerOfGradientBackground({Key? key, required this.childd})
      : super(key: key);
  final Widget childd;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              firstTopClrs,
              secondTopClrs,
              thirdTopClrs,
              fourthTopClrs,
              fifthTopClrs
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: childd);
  }
}

class ContainerOfLogIn extends StatelessWidget {
  const ContainerOfLogIn({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SafeArea(
        child: Container(
          height: (MediaQuery.of(context).size.height * 0.95) ,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: shadowClr, blurRadius: 4, offset: Offset(-3, 3))
              ]),
          child: child,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

dialogForCall(BuildContext context, Color borderClr, Widget dialogDetails) {
  return Center(
    child: AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        content: Builder(builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.84,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: borderClr)),
                      child: dialogDetails),
                ),
              ],
            ),
          );
        })),
  );
}

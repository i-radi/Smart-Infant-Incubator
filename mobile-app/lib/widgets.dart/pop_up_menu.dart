import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

import 'dialog_for_call.dart';
import 'widgets_of_floating_call_button.dart';
import 'widgetsforbabyinfopage.dart';

Widget popUpMenu(BuildContext context, Widget mOrDWidgets, Color clr, txt1,
    txt2, Widget wid2) {
  final CustomPopupMenuController _controller = CustomPopupMenuController();

  return CustomPopupMenu(
    child: Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 0.5, color: clr),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [iconSvgBuild('assets/image/call.svg', Colors.black)]),
    ),
    menuBuilder: () => ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(offset: Offset(3, 3), blurRadius: 0.2)]),
        height: 100,
        child: IntrinsicWidth(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widgetsOfFloatingCallCirculeButton(
                context, clr, txt1, dialogForCall(context, clr, mOrDWidgets)),
            widgetsOfFloatingCallCirculeButton(
                context, clr, txt2, dialogForCall(context, clr, wid2))
          ],
        )),
      ),
    ),
    pressType: PressType.singleClick,
    verticalMargin: -10,
    controller: _controller,
    position: PreferredPosition.top,
    showArrow: true,
    arrowColor: Colors.black,
  );
}

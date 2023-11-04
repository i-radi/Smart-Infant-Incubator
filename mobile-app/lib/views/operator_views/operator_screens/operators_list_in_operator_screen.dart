import '/views/operator_views/operator_widgets/drawer_in_operator.dart';
import '/widgets.dart/appbar.dart';
import '/widgets.dart/cardslist.dart';
import '../../../style/color.dart';
import 'operator_profile_in_operator_screen.dart';
import 'operator_screen.dart';

import 'package:flutter/material.dart';

class OperatorListInOperatorScreen extends StatelessWidget {
  static const namedRoute = 'operator-list-in-operator-screen';
  const OperatorListInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      fun: () {
        Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      leadingColor: iconOfAdminClr,
      sizeOfLeadinIcon: 25,
      drawerClr: iconOfAdminClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      OperatorInOperatorScreen.namedRoute);
                },
                child: cardList(
                  context,
                  "assets/image/operator1.jpg",
                  '',
                  'Operator Name',
                  Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

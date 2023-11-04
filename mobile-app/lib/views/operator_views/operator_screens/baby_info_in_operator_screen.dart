import 'package:flutter/material.dart';

import '../operator_widgets/drawer_in_operator.dart';
import '../operator_widgets/form_field_of_baby_in_operator.dart';
import '../operator_widgets/image_box_of_baby_in_operator.dart';
import 'baby_list_screen_view_operator.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../style/color.dart';

class BabyInfoInOperatorScreen extends StatelessWidget {
  static const namedRoute = '/baby-info-in-operator-screen';
  const BabyInfoInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar(
      appBarTxt: 'Baby Information',
      fun: () {
        Navigator.of(context)
            .pushReplacementNamed(BabyListScreenViewOperator.namedRoute);
      },
      leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
      drawerClr: iconOfAdminClr,
    );

    return Scaffold(
      appBar: appBar,
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ImageBoxOfBabyInOperator(),
            SizedBox(
              height: 8,
            ),
            FormFieldOfBabayInOperator(),
          ],
        ),
      ),
    );
  }
}

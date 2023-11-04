import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../operator_widgets/baby_details_in_operator.dart';
import '/views/operator_views/operator_widgets/drawer_in_operator.dart';
import '/views/operator_views/operator_screens/baby_list_screen_view_operator.dart';

class BabyInformationViewOperator extends StatelessWidget {
  const BabyInformationViewOperator({Key? key}) : super(key: key);
  static const namedRoute = '/baby-information-operator-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          fun: () {
            Navigator.of(context)
                .pushReplacementNamed(BabyListScreenViewOperator.namedRoute);
          },
          leadingColor: black,
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          drawerClr: iconOfAdminClr,
          appBarTxt: 'Baby Information'),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              borderOfBabyPage(context, const BabyDetailsInOperator(),
                  borderOfAdminClr, pageOfDoctorsClr),
              babyImage(context),
            ],
          ),
        ),
      ),
    );
  }
}

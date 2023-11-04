import 'package:final_project/views/operator_views/operator_widgets/drawer_in_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/baby_information_view_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/operator_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import '../operator_widgets/containerwithbutton_for_operator.dart';

class BabyListScreenViewOperator extends StatelessWidget {
  const BabyListScreenViewOperator({Key? key}) : super(key: key);
  static const namedRoute = '/baby-list-in-operator-screen';

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: appBarWithSearchBox(
            context, iconOfAdminClr, iconOfAdminClr, '    Search by Baby code',
            () {
          Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
        }),
        endDrawer: const DrawerInOperator(),
        drawerScrimColor: Colors.white.withOpacity(0.0),
        body: const TabBarForOperator(BabyInformationViewOperator())));
  }
}

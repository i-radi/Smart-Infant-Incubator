import 'package:final_project/views/operator_views/operator_widgets/drawer_in_operator.dart';
import 'package:final_project/views/operator_views/operator_widgets/nurse_details_in_operator.dart';
import 'package:final_project/views/operator_views/operator_screens/nurse_list_screen_view_operator.dart';
import 'package:final_project/widgets.dart/appbar.dart';
import 'package:final_project/widgets.dart/border_widget.dart';
import 'package:final_project/style/color.dart';
import 'package:flutter/material.dart';

class NurseProfileInOperatorScreen extends StatelessWidget {
  static const namedRoute = 'nurse-profile-in-operator-screen';
  const NurseProfileInOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {
          Navigator.of(context)
              .pushReplacementNamed(NurseListScreenViewOperator.namedRoute);
        },
        leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
        drawerClr: iconOfAdminClr,
      ),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(context, const NurseDetailsInOperator(),
          borderOfAdminClr, pageOfAdminClr),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../widgets.dart/add_and_delete_button.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/deletedialog.dart';
import '../../../views/operator_views/operator_widgets/drawer_in_operator.dart';
import '../../../views/operator_views/operator_screens/nurse_info_in_operator_screen.dart';
import '../../../views/operator_views/operator_widgets/nurse_list_details_in_operator.dart';
import 'operator_screen.dart';

class NurseListScreenViewOperator extends StatelessWidget {
  const NurseListScreenViewOperator({Key? key}) : super(key: key);
  static const namedRoute = '/nurse-list-in-operator-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(
              context, 'Nurse name', 'nurse', 'assets/image/nurse5.jpg', () {
            Navigator.of(context)
                .pushReplacementNamed(NurseListScreenViewOperator.namedRoute);
          }), () {
        Navigator.of(context)
            .pushReplacementNamed(NurseInfoInOperatorScreen.namedRoute);
      }),
      appBar: appBarWithSearchBox(
          context, iconOfAdminClr, iconOfAdminClr, '  search by Nurse name ',
          () {
        Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
      }),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: const NurseListDetailsInOperator(),
    );
  }
}

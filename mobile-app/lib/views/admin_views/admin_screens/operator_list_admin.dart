import 'package:final_project/views/admin_views/admin_screens/operator_info_in_admin_screen.dart';
import 'package:final_project/views/admin_views/admin_widgets/operator_list_details_in_admin.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/add_and_delete_button.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/deletedialog.dart';
import '../admin_widgets/drawer_in_admin.dart';
import 'admin_screen.dart';

class OperatorListInAdminScreen extends StatelessWidget {
  const OperatorListInAdminScreen({Key? key}) : super(key: key);
  static const namedRoute = '/operator-list-view-admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(context, 'Operator Name', 'Oprerator',
              'assets/image/operator1.jpg', () {
            Navigator.of(context)
                .pushReplacementNamed(OperatorListInAdminScreen.namedRoute);
          }), () {
        Navigator.of(context)
            .pushReplacementNamed(OperatorInfoInAdminScreen.namedRoute);
      }),
      appBar: appBarWithSearchBox(context, drawerOfAdminClr, drawerOfAdminClr,
          '  search by operator name ', () {
        Navigator.of(context).pop();
      }),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: const OperatorListDetailsInAdmin(),
    );
  }
}

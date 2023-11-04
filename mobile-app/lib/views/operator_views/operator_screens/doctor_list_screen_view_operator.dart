import 'package:flutter/material.dart';

import '../../../widgets.dart/add_and_delete_button.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../widgets.dart/deletedialog.dart';
import '../../../views/operator_views/operator_widgets/doctor_list_details_in_operator.dart';
import '../../../views/operator_views/operator_widgets/drawer_in_operator.dart';
import '../../../views/operator_views/operator_screens/doctor_info_in_operator_screen.dart';
import '../../../views/operator_views/operator_screens/operator_screen.dart';
import '../../../style/color.dart';

class DoctorListScreenViewOperator extends StatelessWidget {
  const DoctorListScreenViewOperator({Key? key}) : super(key: key);
  static const namedRoute = '/doctor-list-in-operator-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(context, 'Dr-Name', 'doctor', 'assets/image/doctor1.jpg',
              () {
            Navigator.of(context)
                .pushReplacementNamed(DoctorListScreenViewOperator.namedRoute);
          }), () {
        Navigator.of(context)
            .pushReplacementNamed(DoctorInfoInOperatorScreen.namedRoute);
      }),
      appBar: appBarWithSearchBox(
          context, iconOfAdminClr, iconOfAdminClr, '  search by doctor name ',
          () {
        Navigator.of(context).pushReplacementNamed(OperatorScreen.namedRoute);
      }),
      endDrawer: const DrawerInOperator(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: const DoctorListDetailsInOperator(),
    );
  }
}

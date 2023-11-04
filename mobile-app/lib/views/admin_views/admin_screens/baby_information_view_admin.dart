import 'package:final_project/views/admin_views/admin_screens/baby_list_screen_view_admin.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/appbar.dart';
import '../admin_widgets/baby_info_details_form_in_admin.dart';
import '../../../widgets.dart/babyimage.dart';
import '../../../widgets.dart/borderofbadypage.dart';
import '../../../style/color.dart';
import '../admin_widgets/drawer_in_admin.dart';

class BabyInformationViewAdmin extends StatelessWidget {
  static const namedRoute = '/baby-information-view-admin';

  const BabyInformationViewAdmin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          appBarTxt: 'Baby Information',
          drawerClr: drawerOfAdminClr,
          leadingColor: black,
          leadingSvgiconInAppBar: 'assets/image/backarrow.svg',
          fun: () {
            Navigator.of(context)
                .pushReplacementNamed(BabyListScreenViewAdmin.namedRoute);
          }),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              borderOfBabyPage(
                context,
                const BabyInformationDetailsInAdmin(),
                borderOfAdminClr,
                pageOfDoctorsClr,
              ),
              babyImage(context),
            ],
          ),
        ),
      ),
    );
  }
}

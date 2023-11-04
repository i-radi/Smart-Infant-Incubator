import 'package:final_project/views/admin_views/admin_screens/doctor_info_in_admin_scareen.dart';
import 'package:final_project/views/admin_views/admin_screens/doctor_profile_in_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets.dart/add_and_delete_button.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../widgets.dart/cardslist.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/deletedialog.dart';
import '../admin_widgets/drawer_in_admin.dart';
import 'admin_screen.dart';

class DoctorListScreenViewAdmin extends StatelessWidget {
  const DoctorListScreenViewAdmin({Key? key}) : super(key: key);
  static const namedRoute = '/doctor-list-view-admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(context, 'Dr-Name', 'doctor', 'assets/image/doctor1.jpg',
              () {
            Navigator.of(context)
                .pushReplacementNamed(DoctorListScreenViewAdmin.namedRoute);
          }), () {
        Navigator.of(context)
            .pushReplacementNamed(DoctorInfoInAdminScreen.namedRoute);
      }),
      appBar: appBarWithSearchBox(context, drawerOfAdminClr, drawerOfAdminClr,
          '  search by doctor name ', () {
        Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
      }),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.h)),
            Center(
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DoctorProfileInAdminScreen()),
                  );
                },
                child: cardList(context, 'assets/image/doctor1.jpg', 'Dr.name',
                    'Not yet', Container()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

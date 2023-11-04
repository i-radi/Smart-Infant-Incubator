import 'package:final_project/views/admin_views/admin_screens/nurse_info_in_admin_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart/add_and_delete_button.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../widgets.dart/cardslist.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/deletedialog.dart';
import '../admin_widgets/drawer_in_admin.dart';
import 'admin_screen.dart';
import 'nuse_profile_in_admin_screen.dart';

class NurseListScreenViewAdmin extends StatelessWidget {
  const NurseListScreenViewAdmin({Key? key}) : super(key: key);
  static const namedRoute = 'nurse_list_view_admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addAndDeletButton(
          context,
          deleteDialog(
              context, 'Nurse name', 'nurse', 'assets/image/nurse5.jpg', () {
            Navigator.of(context)
                .pushReplacementNamed(NurseListScreenViewAdmin.namedRoute);
          }), () {
        Navigator.of(context)
            .pushReplacementNamed(NurseInfoInAdminScreen.namedRoute);
      }),
      appBar: appBarWithSearchBox(context, drawerOfAdminClr, drawerOfAdminClr,
          '  search by Nurse name ', () {
        Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
      }),
      endDrawer: const DrawerInAdmin(),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),
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
                            const NurseProfileInAdminScreen()),
                  );
                },
                child: cardList(context, 'assets/image/nurse5.jpg', 'name',
                    'Not yet', Container()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

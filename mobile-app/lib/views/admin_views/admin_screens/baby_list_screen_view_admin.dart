import '../admin_widgets/tab_bar_for_admin.dart';
import '/views/admin_views/admin_widgets/drawer_in_admin.dart';
import '../../../widgets.dart/appbarwithsearchbox.dart';
import '../../../style/color.dart';
import 'admin_screen.dart';

import 'package:flutter/material.dart';

import 'baby_information_view_admin.dart';


class BabyListScreenViewAdmin extends StatefulWidget {
  static const namedRoute = '/baby-list-screen-view-admin';

  const BabyListScreenViewAdmin({Key? key}) : super(key: key);

  @override
  _BabyListScreenViewAdminState createState() =>
      _BabyListScreenViewAdminState();
        
}

class _BabyListScreenViewAdminState extends State<BabyListScreenViewAdmin> {                                       
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithSearchBox(
            context, iconOfAdminClr, iconOfAdminClr, '    Search by Baby code',
            () {
          Navigator.of(context).pushReplacementNamed(AdminScreen.namedRoute);
        }),
        endDrawer: const DrawerInAdmin(),
        drawerScrimColor:Colors.white.withOpacity(0.0),
        body:  const TabBarForAdmin( BabyInformationViewAdmin(), )
        );
  }  
}

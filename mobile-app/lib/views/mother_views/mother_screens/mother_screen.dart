import 'package:flutter/material.dart';
import '../mother_widgets/drawer_in_mother.dart';
import '../mother_widgets/mother_details.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';

class MotherScreen extends StatelessWidget {
  const MotherScreen({Key? key}) : super(key: key);
  static const namedRoute = 'mother-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        fun: () {},
        drawerClr: iconOfMotherClr,
      ),
      endDrawer: const DrawerInMother(fromMotherHome: true,),
      drawerScrimColor: Colors.white.withOpacity(0.0),
      body: buildBorder(
          context, const MotherDetails(), borderOfMotherClr, pageOfMotherClr),
    );
  }
}

import 'package:final_project/providers/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/views/auth_views/auth_widgets/details_in_sign_up_of_admin.dart';
import '/widgets.dart/appbar.dart';
import '/widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import '/widgets.dart/container_of_gradiant_background.dart';

class SignUpOfAdminScreen extends StatelessWidget {
  static const namedRoute = '/sign_up-admin-screen';
  const SignUpOfAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerOfGradientBackground(
      childd: Scaffold(
          backgroundColor: transparent,
          appBar: appBarForAuth(
              leadingImg: 'assets/image/backarrow.svg',
              onPressed: () {
                Navigator.of(context).pop();
              },
              actionImg: 'assets/image/babydrawer.svg'),
          body: ChangeNotifierProvider(
            create: (_) => AuthProvider(),
            builder: (context, _) => BorderOfAuth(
              chiled: DetailsInSignUpOfAdmin(),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

import '../auth_widgets/image_details_for_admin_in_auth.dart';
import '../../../widgets.dart/appbar.dart';
import '../../../widgets.dart/border_widget.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/container_of_gradiant_background.dart';

class ImageAndHospitalDetailsForAdminInAuthScreen extends StatelessWidget {
  static const namedRoute =
      '/Image-and-hospital-details-for-admin-in-auth-screen';
  const ImageAndHospitalDetailsForAdminInAuthScreen({Key? key})
      : super(key: key);

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
        body: const SingleChildScrollView(
          child: BorderOfAuth(chiled: ImageDetailsForAdminInAuth()),
        ),
      ),
    );
  }
}

import 'package:final_project/providers/auth/auth_provider.dart';
import 'package:final_project/widgets.dart/babyimage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_widgets/details_in_login.dart';
import '../../../style/color.dart';
import '../../../widgets.dart/container_of_gradiant_background.dart';

class LoginScreen extends StatelessWidget {
  static const namedRoute = '/login-screen';
 

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerOfGradientBackground(
      childd: Scaffold(
          //  resizeToAvoidBottomInset: false,
          backgroundColor: transparent,
          body: SingleChildScrollView(
                child: Stack(
                  children:  [
                    ChangeNotifierProvider(create: (_) => AuthProvider(),builder: (context , _) =>   ContainerOfLogIn(
                      child: DetailsInLogin(),
                    ),),
                   
                    ImageOfHandsWithPosition(),
                  ],
                ),
              )
            
          
          ),
    );
  }
}

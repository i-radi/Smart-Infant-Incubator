import 'package:flutter/material.dart';

import '../../../views/nurse_views/nurse_screens/doctor_profile_in_nurse_screen.dart';
import '../../../widgets.dart/cardslist.dart';

class DoctorListScreenDetailsInNurse extends StatelessWidget {
  const DoctorListScreenDetailsInNurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                    DoctorProfileInNurseScreen.namedRoute);
              },
              child: Center(
                child: cardList(context, 'assets/image/doctor1.jpg',
                    'Doctor name 1', '', null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

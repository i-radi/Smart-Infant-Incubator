import 'package:flutter/material.dart';

import '../../../views/doctor_views/doctor_screens/nurse_profile_in_doctor_screen.dart';
import '../../../widgets.dart/cardslist.dart';

class NurseListDetailsInDoctor extends StatelessWidget {
  const NurseListDetailsInDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      NurseProfileInDoctorScreen.namedRoute);
                },
                child: cardList(context, 'assets/image/nurse2.jpg',
                    'Nurse name 1', '', Container()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

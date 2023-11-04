import 'package:flutter/material.dart';

import '../../../views/doctor_views/doctor_screens/baby_info_screen_view.dart';
import '../../../widgets.dart/cardslist.dart';

class BabyListDetailsInDoctor extends StatelessWidget {
  const BabyListDetailsInDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: InkWell(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(BabyInfoScreenViewDoctor.namedRoute);
              },
              child: cardList(context, 'assets/image/baby.jpg',
                  'Baby Code :1234', 'Birth date :../../.... ', Container()),
            ),
          ),
        ],
      ),
    );
  }
}

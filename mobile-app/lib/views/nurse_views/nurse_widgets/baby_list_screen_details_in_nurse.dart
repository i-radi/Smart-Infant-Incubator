import 'package:flutter/material.dart';

import '../../../widgets.dart/cardslist.dart';
import '../../../views/nurse_views/nurse_screens/baby_info_screen_view_nurse.dart';

class BabyListScreenDetailsInNurse extends StatelessWidget {
  const BabyListScreenDetailsInNurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          InkWell(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BabyInfoScreenViewNurse()),
              );
            },
            child: Center(
              child: cardList(context, 'assets/image/baby.jpg',
                  'Baby Code :1234', 'Birth date :../../.... ', Container()),
            ),
          ),
        ],
      ),
    );
  }
}

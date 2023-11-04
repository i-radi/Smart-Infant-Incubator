import 'package:flutter/material.dart';

import '../mother_screens/baby_screen_view_mother.dart';
import '../../../../widgets.dart/cardslist.dart';

class BabyListDetailsInMother extends StatelessWidget {
  const BabyListDetailsInMother({Key? key}) : super(key: key);

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
                    .pushReplacementNamed(BabyScreenViewMother.namedRoute);
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

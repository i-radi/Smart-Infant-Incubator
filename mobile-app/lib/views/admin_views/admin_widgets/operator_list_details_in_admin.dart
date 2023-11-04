import 'package:flutter/material.dart';

import '../../../widgets.dart/cardslist.dart';
import '/views/admin_views/admin_screens/operator_profile_in_admin_screen.dart';

class OperatorListDetailsInAdmin extends StatelessWidget {
  const OperatorListDetailsInAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Center(
            child: InkWell(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const OperatorProfileInAdminScreen()),
                );
              },
              child: cardList(context, 'assets/image/operator1.jpg',
                  'Operator name', '', Container()),
            ),
          ),
        ],
      ),
    );
  }
}

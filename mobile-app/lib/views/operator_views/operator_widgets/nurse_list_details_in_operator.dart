import 'package:flutter/material.dart';
import '../../../views/operator_views/operator_screens/nurse_profile_in_operator_screen.dart';
import '../../../widgets.dart/cardslist.dart';

class NurseListDetailsInOperator extends StatelessWidget {
  const NurseListDetailsInOperator({Key? key}) : super(key: key);

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NurseProfileInOperatorScreen()),
                );
              },
              child: Center(
                child: cardList(context, 'assets/image/nurse5.jpg', 'name',
                    'Not yet', Container()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

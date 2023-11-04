import 'package:final_project/views/operator_views/operator_screens/doctor_profile_in_operator_screen.dart';
import 'package:final_project/widgets.dart/cardslist.dart';
import 'package:flutter/material.dart';

class DoctorListDetailsInOperator extends StatelessWidget {
  const DoctorListDetailsInOperator({Key? key}) : super(key: key);

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
                          const DoctorProfileInOperatorScreen()),
                );
              },
              child: cardList(context, 'assets/image/doctor1.jpg', 'Dr.name',
                  'Not yet', Container()),
            ),
          ),
        ],
      ),
    );
  }
}

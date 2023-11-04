//import 'package:uuid/uuid.dart';

class EmployeeInfo {
  final String userId;
  final String university;
  final String degreeOfPromotion;
  final String specialization;


  EmployeeInfo(
      {required this.degreeOfPromotion,
      required this.specialization,
      required this.university,
      required this.userId});


    
Map<String, dynamic> tojson() {

  return {
  'userId' : userId ,
  'university' : university ,
  'degreeOfPromotion' : degreeOfPromotion,
  'specialization' : specialization,
  };
}

factory EmployeeInfo.fromjson(Map<String,dynamic> map) {
  return EmployeeInfo(
     degreeOfPromotion: map['degreeOfPromotion'],
     specialization: map['specialization'],
     university: map['university'],
     userId: map['userId']
     );
}



}

import 'package:final_project/models/incubator_model.dart';
import 'package:uuid/uuid.dart';

class BabyInfo {
  final String babyCode;
  final DateTime birthDate;
  final String gender;
  final Uuid id;
  final Incubator incubatorId;


 
  

  BabyInfo(
      {required this.babyCode,
      required this.birthDate,
      required this.gender,
      required this.id,
      required this.incubatorId});



 
  Map<String, dynamic> toJson() {
    return {
      'babyCode': babyCode,
      'birthDate': birthDate,
      'gender': gender,
      'id': id,
      'incubatorId': incubatorId,
     
    };
  }
  

  factory BabyInfo.fromJson(Map<String, dynamic> map) {
    return BabyInfo(

      babyCode: map['babyCode'] as String,
       birthDate:  map['birthDate'] as DateTime,
       gender: map['gender'] as String,
       id: map['id'] as Uuid,
       incubatorId: map['incubatorId'] as Incubator
       );
  }
 
}
 
import 'package:final_project/models/incubator_model.dart';

class UserInfo {
  final String? id;
  final String? userPictureId;
  final String userPicture;
  final String? incubatorId;
  final String userName;
  final String name;
  final String phoneNumber;
  final String email;
  final Incubator incubator;

  UserInfo(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.userPicture,
      required this.userPictureId,
      required this.phoneNumber,
      required this.incubator,
      required this.incubatorId});

 
Map<String, dynamic> tojson() {

  return {
  'id' : id ,
  'userPictureId' : userPictureId ,
  'incubatorId' : incubatorId ,
  'userName' : userName,
  'name' : name ,
  'userPictre' : userPicture ,
  'phoneNumper' : phoneNumber ,
  'email' : email ,
  'incubator' : incubator ,
  };
}


factory UserInfo.fromjson(Map<String,dynamic> map) {
  return UserInfo(id: map['id'],
   name: map['name'],
    userName: map['userName'],
    email: map['email'],
    userPicture: map['userPicture'],
    userPictureId: map['userPictureId'],
     phoneNumber: map['phoneNumber'],
     incubator: map['incubator'],
     incubatorId: map['incubatorId']);
}


}

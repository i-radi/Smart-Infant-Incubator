import 'package:uuid/uuid.dart';

class HospitalInfo {
  final String  id; //the uuid package return a string type there is no uuid type
  final String name;
  final String phone;

  HospitalInfo({
    required this.id,
    required this.name,
    required this.phone,
  });


     
Map<String, dynamic> tojson() {

  return {
  'Id' : id ,
  'name' : name ,
  'phone' : phone,
  
  };
}

 
 factory HospitalInfo.fromjson(Map<String,dynamic> map) {
  return HospitalInfo(
          id:map['id'],
          name: map['name'],
          phone: map['phone']
     );
}
  

}

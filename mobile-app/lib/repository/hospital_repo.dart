import 'dart:developer';
import 'package:final_project/endpoints.dart';
import 'package:final_project/helper/dio_helper.dart';
import 'package:final_project/models/hospital_model.dart';

class HospitalRepo{

  final DioHelper _dioHelper = DioHelper();



Future<HospitalInfo?> postHospital({required String name , required String phone}) async{

  final Map<String,dynamic>? respons = await _dioHelper.post(Endpoints.hospital , data: {'name' : name , 'phone' : phone}); 
   log('$respons');
    if(respons == null){
      return null;
    }
     return HospitalInfo.fromjson(respons);

}



  
Future<HospitalInfo?> getHospital() async{

 final Map<String,dynamic>? respons = await _dioHelper.get(Endpoints.hospital); 
  log('$respons');
    if(respons == null){
      return null;
    }
     return HospitalInfo.fromjson(respons);   

  

}

}
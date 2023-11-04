import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/endpoints.dart';
import 'package:final_project/models/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class EmployeeRepo{
  EmployeeRepo._() {
    dio = Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }

  static final employeeInastance = EmployeeRepo._();
  
   late Dio dio ;
   late EmployeeInfo employeeInfoo;

    Future<EmployeeInfo?> postEmployee({required Uuid userId ,
     required String university ,required String degreeOfPromotion ,
      required String specialization}) async{

     dio.options.headers = {'Access-Control-Allow-Origin': '*'};

    try {
      final response = await dio.post(Endpoints.employees , data: {'userId' : userId ,'university' : university , 
                        'degreeOfPromotion' : degreeOfPromotion ,'specialization' : specialization });

    log(response.data);
    employeeInfoo = EmployeeInfo.fromjson(response.data);

    }catch(e) {
  
     debugPrint(e.toString());
      return null;
   }

  }

  

   Future<EmployeeInfo?> getEmployee() async{

    dio.options.headers = {'Access-Control-Allow-Origin': '*'};
    

   try {
    final response = await dio.get(Endpoints.employees,);

   employeeInfoo = EmployeeInfo.fromjson(response.data);

    
   log(response.data);

    return response.data;

   }catch(e) {
    debugPrint(e.toString());
     return null;
 }
 
  //{required Uuid userId , required String university ,required String degreeOfPromotion ,required String specialization}

}
}



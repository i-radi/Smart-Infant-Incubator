/*


import 'package:final_project/models/employee_model.dart';
import 'package:final_project/repository/employee_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


   final employeeDataViewModel = ChangeNotifierProvider<GetEmployeeDataFromApi>((ref) => GetEmployeeDataFromApi());

   class GetEmployeeDataFromApi extends ChangeNotifier{
    GetEmployeeDataFromApi(){
      initData();
    }

    //List<UserInfo> listOfUsers = [];

    List<EmployeeInfo> listOfDoctors = [];

    initData(){
      getDoctorList();
    }

    getDoctorList() async {
      final _reponse = await EmployeeRepo.employeeInastance.getEmployee();
      if(_reponse == null){
        // show error
      }else{
        listOfDoctors = List<EmployeeInfo>.from((_reponse.map((e)=>EmployeeInfo.fromjson(e))));
        notifyListeners();
        print(listOfDoctors[0].degreeOfPromotion);
        print(listOfDoctors[1].degreeOfPromotion);
      }
    }
  }

  */
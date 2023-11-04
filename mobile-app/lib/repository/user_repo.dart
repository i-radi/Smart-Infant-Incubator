import 'dart:developer';

import 'package:final_project/endpoints.dart';
import 'package:final_project/helper/dio_helper.dart';
import 'package:final_project/models/auth_model.dart';

class AuthMetods{
  final DioHelper _dioHelper =DioHelper();


  Future<Authentication?> login({required String email,required String password})async{
    final Map<String,dynamic>? respons = await _dioHelper.post(Endpoints.login,data: {'email': email, 'password': password});
    log('$respons');
    if(respons == null){
      return null;
    }
    return Authentication.fromJson(respons);
  }

   Future<Authentication?> register({required String email,required String password,required String name,required String userName})async{
    final Map<String,dynamic>? respons = await _dioHelper.post(Endpoints.register,data: { 'name' : name , 'username' : userName , 'email' : email , 'password' : password});
    log('$respons');
    if(respons!= null){
      return Authentication.fromJson(respons);
    }
    return null;
  }
}


// class UserRepo{
//   final DioHelper helper = DioHelper();
//   UserRepo._() {
//      dio = Dio(
//       BaseOptions(
//         connectTimeout: 10000,
//         receiveTimeout: 10000,
//       ),
//     );
// }


//     static final userInstance = UserRepo._();

//    late Dio dio ;
//    late Authentication userAuthantication;
//    late UserInfo userInfoo ;


//    Future<Authentication?> postUserAuth({required String name , required String userName , required String email , required String password }) async{

//    dio.options.headers = {'Access-Control-Allow-Origin': '*' ,'Accept': "application/json",};
//    const String url =  Endpoints.users+'/register';

//     try {
//      final response = await dio.post(url , data: { 'name' : name , 'username' : userName , 'email' : email , 'password' : password});

//       print(response.data);

//         userAuthantication = Authentication.fromJson(response.data);
//         log(userAuthantication.email);
//        return userAuthantication;

//     }catch(e) {
  
//       debugPrint(e.toString());

//     return null;
//  }

//   }


  
//    Future<UserInfo?> getUser() async{
  
//     try {
//      final response = await dio.get(Endpoints.users ,
//     // options: Options( headers: { "Authorization": "Bearer  ${contapp.token}", "www-authenticate": "Bearer  $token" },  ),

// );
    
//      log(response.data);

//      userInfoo = UserInfo.fromjson(response.data);
//      print(userInfoo.id);
//      log(userInfoo.id!);
//      return response.data;
     
//     }catch(e) {
  
//       debugPrint(e.toString());
//     return null;
//  }

//   }

 

// }

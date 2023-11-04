import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project/endpoints.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:flutter/cupertino.dart';

class AuthRepo {
AuthRepo._() {
    dio = Dio(
      BaseOptions(
        connectTimeout: 20000,
        receiveTimeout: 20000,
      ),
    );
  }

  static final authInstance = AuthRepo._();

  late Dio dio;

  late Authentication authentication;

  Future<Authentication?> login(
      {required String email, required String password}) async {
    //dio.options.headers = {'Content-Type': 'application/json'};
    //dio.options.headers = {"Accept": "application/json", 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};
    const String url = Endpoints.users+'/login';


    try {
     final response = await dio.post(url , data: {'email': email, 'password': password},);

      log(response.data);

      authentication = Authentication.fromJson(response.data);
       print(authentication.roles);
      // log(authentication.roles);
       return authentication;

    }catch(e) {
  
      debugPrint(e.toString());

    return null;
 }

  }



    
  }





//http://127.0.0.1:5000/api/Babies


//https://gorest.co.in/public/v2/users

//10.0.2.2    emulator

/*
 final response = await dio.post(
      url,
      data: {'email': email, 'password': password},
    ).then((res) {
      if (res.statusCode! < 300) {
        authentication = Authentication.fromJson(res.data);
        SharedPrefs.saveToken(authentication.token);

        return res.data as Map<String, dynamic>;
      }
    }).catchError(() {
      return {'error': 'Email or Password is incorrect!'};
    }).onError((error, stackTrace)  {
        return {'error': 'Email or Password is incorrect!'};
    });

    return response as Map<String, dynamic>;
    //  print(response.data);
  }
}
*/
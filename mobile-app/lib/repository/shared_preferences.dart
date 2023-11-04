import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

 static Future saveToken(String token) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }


 static Future<Object?> getToken() async{
  
  SharedPreferences prefs = await SharedPreferences.getInstance();

   var token =   prefs.get('token');

   return token;

 

  }
}

import 'package:final_project/enums.dart';
import 'package:final_project/models/auth_model.dart';
import 'package:final_project/repository/user_repo.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
      final AuthMetods _auth = AuthMetods();
      AppState state= AppState.init;
Authentication? auth;
   String _name='',_userName='',_password='',_email='';
bool _isObsecure = true;

  //  String get name=>_name;
  //  String get userName=>_userName;
    String get password=>_password;
  //  String get email=>_email;

bool get isObsecure  =>_isObsecure;

void changeVisability(){
  _isObsecure= !_isObsecure;
  notifyListeners();
}
   Future<void> signUp()async{
    
     state = AppState.loading;
     notifyListeners();
    

  
    auth = await _auth.register(email: _email, password: _password, name: _name, userName: _userName);
   // log('$auth');
    if(auth ==null){
      print('error');
         state = AppState.error;
    }else{
         print('done');
         state = AppState.done;
    }
     notifyListeners();

   }
   

   Future<void> loging()async{

     
     state = AppState.loading;
     notifyListeners();
    

  
     auth =    await _auth.login(email: 'admin@mail.com', password: 'Pa\$\$w0rd');
    if(auth ==null){
      print('error');
         state = AppState.error;
    }else{
         print(auth!.token.uid);
         state = AppState.done;
    }
     notifyListeners();

   }

   void setName(String n){
  
     _name =n;
     
   }

   void setUserName(String u){
     _userName = u;
   }

   void setEmail(String e){
     _email = e;
     print(e);
   }
  
  void setPassword(String p) {
    _password = p ;
  }
  String? emailValidation(String? value){
    
  }

}

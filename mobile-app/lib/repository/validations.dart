class AuthValidation{
  static String? emailValidation(String? input){
    const String _emailRegEx =
     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$";
     
     if(RegExp(_emailRegEx).hasMatch(input!.trim())){
       return null ;
     }
     return 'invalid email';
  }

  static String? passwordValidation(String? passinput){
    const String _passwordRegEx = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})";
    if(RegExp(_passwordRegEx).hasMatch(passinput!.trim())){
      return null;
    }
    return 'invalid passwrd';
  }

  static bool confirmPassword(String pass ,String repeatPass) => pass == repeatPass;


}
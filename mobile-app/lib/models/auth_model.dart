import 'package:final_project/models/token.dart';

class Authentication {
  final String? message;
  final bool isAuthenticated;
  final String username;
  final String email;
  final List<String> roles;
  final JwtToken token;
  final String expiresOn;

  Authentication(
      {required this.token,
      required this.email,
      required this.expiresOn,
      required this.isAuthenticated,
      required this.message,
      required this.roles,
      required this.username,});

      
  Map<String, dynamic> toJson() {

    return {
      'message': message,
      'isAuthenticated': isAuthenticated,
      'username': username,
      'email': email,
      'roles': roles,
      'token': token,
      'expiresOn': expiresOn,
    };
  }

  factory Authentication.fromJson(Map<String, dynamic> map) {
    return Authentication(
      message: map['message'] ?? '',
      isAuthenticated: map['isAuthenticated'] as bool,
      username: map['username'] as String,
      email: map['email'] as String,
      roles: List<String>.from(map['roles'].map((role)=>role)),
      token: JwtToken.fromjson( map['token'] as String),
      expiresOn: map['expiresOn'] as String,
    );
  }
}

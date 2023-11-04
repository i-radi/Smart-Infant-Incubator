import 'dart:convert';

import 'dart:typed_data';

class JwtToken {
  final String sub, jti, email, uid, roles, iss, aud;
  final int exp;

  factory JwtToken.fromjson(String token) {
    final Map<String, dynamic> deToken = detokenize(token);
    return JwtToken(
      aud: deToken['aud'],
      email: deToken['email'],
      exp: deToken['exp'],
      iss: deToken['iss'],
      jti: deToken['jti'],
      roles: deToken['roles'],
      sub: deToken['sub'],
      uid: deToken['uid'],
    );
  }

  JwtToken({
    required this.sub,
    required this.jti,
    required this.email,
    required this.uid,
    required this.roles,
    required this.exp,
    required this.iss,
    required this.aud,
  });

  static Map<String, dynamic> detokenize(String token) {

    final List<String> splittedToken = token.split('.');

    final String normalizedSource = base64Url.normalize(splittedToken[1]);
    final Uint8List decoded = base64Url.decode(normalizedSource);
    
    final String utf8String = utf8.decode(decoded);
    print(utf8String);

    return json.decode(utf8String);
//   return ts;
  }
}

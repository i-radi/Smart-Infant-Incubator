import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );

  Future<Map<String,dynamic>?> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      final Response response =
          await _dio.get(url,options: Options(headers:headers ));
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
    Future<Map<String,dynamic>?> post(String url, {dynamic data}) async {
    try {
      final Response response =
          await _dio.post(url,data:data );
      return response.data;
    } catch (_) {
      return null;
    }
  }
}

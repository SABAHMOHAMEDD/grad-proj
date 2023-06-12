import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = init();

  static init() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://1fca-156-196-31-61.ngrok-free.app/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String url = 'model/parse',
    required String query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      data: {'text': query},
    );
  }

  static Future<Response> PostData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ""
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> PUTData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? ""
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
}

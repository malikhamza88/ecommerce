import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:learning_getx/service/http_service.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "fb12a31181aa4498ba52877978913275";

class HttpServiceImplementation implements HttpService {
  late Dio _dio;

  @override
  Future<http.Response> getRequest(String url) async {
    try {
      http.Response _data = await http.get(
          Uri.parse('https://newsapi.org/$url'),
          headers: {"Authorization": "Bearer $API_KEY"});
      return _data;
    } on DioError catch (e) {
      debugPrint('HttpServiceImplementation.getRequest: ${e.message}');
      throw Exception(e.message);
    }
  }

  _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (e, handler) {
        debugPrint(
            'HttpServiceImplementation._initializeInterceptors: ${e.message}');
      }, onRequest: (req, _) {
        debugPrint('${req.method} | ${req.path} | ${req.data}');
      }, onResponse: (res, _) {
        debugPrint('${res.statusCode} | ${res.statusMessage} | ${res.data}');
      }),
    );
  }

  @override
  void init() {
    _dio = Dio(
      BaseOptions(
          baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}),
    );
    _initializeInterceptors();
  }
}

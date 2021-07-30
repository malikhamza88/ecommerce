import 'package:http/http.dart' as http;

abstract class HttpService {
  void init();

  Future<http.Response> getRequest(String url);
}

import 'package:http/http.dart' as http;
import 'package:learning_getx/model/product.dart';

class RemoteServices {
  static var client = http.Client();
  static final String url =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}

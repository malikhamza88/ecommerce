import 'package:get/state_manager.dart';
import 'package:learning_getx/model/product.dart';
import 'package:learning_getx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var data = await RemoteServices.fetchProducts();
    if (data != null) {
      productList.value = data;
    }
  }
}

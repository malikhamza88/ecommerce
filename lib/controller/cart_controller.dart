import 'package:get/get.dart';
import 'package:learning_getx/model/product.dart';

class CartController extends GetxController {
  var cartItem = List.empty().obs;

int get count => cartItem.length;
  double get totalPrice => cartItem.fold(0, (sum, item) => sum + item.price);

  void addToCart(Product product) {
    cartItem.add(product);
  }
}

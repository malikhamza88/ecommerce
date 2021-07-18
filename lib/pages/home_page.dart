import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controller/cart_controller.dart';
import 'package:learning_getx/controller/count_controller.dart';
import 'package:learning_getx/controller/productController.dart';

class HomePage extends StatelessWidget {
  final CountController c = Get.put(CountController());
  final CartController cartController = Get.put(CartController());
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Clicks: ${c.count}")),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ProductController>(
              builder: (ProductController controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                            Obx(
                              () => IconButton(
                                icon: controller
                                        .products[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(
                                        Icons.check_box_outline_blank_outlined),
                                onPressed: () {
                                  controller.products[index].isFavorite
                                      .toggle();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(() => Text(
                'Total amount: \$ ${cartController.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.black),
              )),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
    );
  }
}

class Other extends StatelessWidget {
  final CountController c = Get.find();
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

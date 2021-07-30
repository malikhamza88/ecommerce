import 'package:get/get.dart';
import 'package:learning_getx/core/repository/news_repo_impl.dart';
import 'package:learning_getx/featurs/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImplementation());
    Get.put(NewsHeadlineController());
  }
}

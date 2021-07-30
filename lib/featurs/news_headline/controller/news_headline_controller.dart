import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learning_getx/core/repository/news_repo_impl.dart';
import 'package:learning_getx/core/repository/news_repository.dart';
import 'package:learning_getx/model/article.dart';

class NewsHeadlineController extends GetxController {
  RxList<Article> articles = List<Article>.empty().obs;
  RxBool isLoading = false.obs;
  late NewsRepo _newsRepo;

  @override
  void onInit() {
    super.onInit();
    _newsRepo = Get.find<NewsRepoImplementation>();
    _loadNews();
  }

  Future<void> _loadNews() async {
    toggleLoading();
    final result = await _newsRepo.getNewsHeadline();
    toggleLoading();
    if (result.isNotEmpty) {
      articles.value = result;
    } else {
      debugPrint('NewsHeadlineController._loadNews: Load News Failed');
    }
  }

  void toggleLoading() {
    isLoading.toggle();
  }
}

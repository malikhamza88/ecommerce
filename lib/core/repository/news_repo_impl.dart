import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:learning_getx/core/repository/news_repository.dart';
import 'package:learning_getx/model/article.dart';
import 'package:learning_getx/model/news_response_model.dart';
import 'package:learning_getx/service/http_service.dart';
import 'package:learning_getx/service/http_service_imple.dart';

class NewsRepoImplementation implements NewsRepo {
  late HttpService _httpServices;

  NewsRepoImplementation() {
    _httpServices = Get.put(HttpServiceImplementation());
    _httpServices.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async {
    try {
      final response =
          await _httpServices.getRequest('/v2/top-headlines?country=us');
      final parsedData = NewsResponseModel.fromJson(response.data);

      return parsedData.articles!;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed While Fetching News Headline');
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async {
    try {
      final response =
          await _httpServices.getRequest('/v2/everything?q=$query');
      final parsedData = NewsResponseModel.fromJson(response.data);

      return parsedData.articles!;
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed While Fetching News Headline');
    }
  }
}

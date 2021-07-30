import 'package:learning_getx/model/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchedNews(String query);
}

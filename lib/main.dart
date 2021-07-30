import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/featurs/news_headline/binding/news_headline_binding.dart';
import 'package:learning_getx/featurs/news_headline/view/news_headline_view.dart';
import 'package:learning_getx/featurs/search_news/binding/search_news_binding.dart';
import 'package:learning_getx/featurs/search_news/view/search_news_view.dart';
import 'package:learning_getx/utils/string_constants.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: StringConsts.NewsHeadline,
          page: () => NewsHeadlineView(),
          binding: NewsHeadlineBinding(),
        ),
        GetPage(
          name: StringConsts.SearchNews,
          page: () => SearchNewsView(),
          binding: SearchNewsBinding(),
        ),
      ],
      initialRoute: StringConsts.NewsHeadline,
    ),
  );
}

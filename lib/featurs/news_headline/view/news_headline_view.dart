import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/core/widgets/custom_drawer.dart';
import 'package:learning_getx/featurs/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('News Headline'),
      ),
      drawer: CustomDrawer(),
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(10),
            child: controller.articles.isEmpty
                ? Center(
                    child: Text('No News for now'),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final singleArticle = controller.articles[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          singleArticle.urlToImage == null
                              ? Container(height: 300)
                              : CachedNetworkImage(
                                  imageUrl: singleArticle.urlToImage!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  height: 300,
                                ),
                          SizedBox(height: 8),
                          Text(
                            singleArticle.title!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                          Text(
                            singleArticle.description!,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                    itemCount: controller.articles.length),
          );
        },
      ),
    );
  }
}

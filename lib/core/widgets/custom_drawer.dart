import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/utils/string_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('News Headline'),
            onTap: () {
              Get.offNamed(StringConsts.NewsHeadline);
            },
            leading: Icon(Icons.arrow_drop_down_circle),
          ),
          ListTile(
            title: Text('Search News'),
            onTap: () {
              Get.offNamed(StringConsts.SearchNews);
            },
            leading: Icon(Icons.archive_rounded),
          )
        ],
      ),
    );
  }
}

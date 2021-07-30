import 'package:flutter/material.dart';
import 'package:learning_getx/core/widgets/custom_drawer.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      drawer: CustomDrawer(),
      body: Container(),
    );
  }
}

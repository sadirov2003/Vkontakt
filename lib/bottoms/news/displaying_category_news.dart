import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vk_application/bottoms/news/api_news.dart';
import 'package:flutter_vk_application/bottoms/news/displaying_news.dart';
import 'package:flutter_vk_application/bottoms/news/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DispayingCategoryNews extends StatefulWidget {
  final String categoryName;
  DispayingCategoryNews({
    required this.categoryName,
  });

  @override
  State<DispayingCategoryNews> createState() => _DispayingCategoryNewsState();
}

class _DispayingCategoryNewsState extends State<DispayingCategoryNews> {
  final apiCategoryNews = ApiCategoryNews();
  List<NewsModel> _categoryNews = [];
  bool _loading = true;

  void getCategoryNews() async {
    await apiCategoryNews.getNews(widget.categoryName);
    final categoryNews = await _gettingCategoryNews();
    _categoryNews = categoryNews;
    setState(() {
      _loading = false;
    });
  }

  Future<List<NewsModel>> _gettingCategoryNews() async {
    final _storage = SharedPreferences.getInstance();
    final storage = await _storage;
    final categoryNewsInfo = storage.getString('categoryNews_key');
    if (categoryNewsInfo == null) {
      throw Exception('В хранилище отсутствует данные');
    } else {
      final jsonData = json.decode(categoryNewsInfo);
      Iterable list = jsonData['articles'];
      return list.map((dynamic n) => NewsModel.fromJson(n)).toList();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: _categoryNews.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogTile(
                          imageUrl: _categoryNews[index].urlToImage!,
                          title: _categoryNews[index].title,
                          desc: _categoryNews[index].description!,
                          url: _categoryNews[index].url,
                        );
                      }),
                ),
              ]),
            ),
    );
  }
}

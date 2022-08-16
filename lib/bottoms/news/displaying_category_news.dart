import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vk_application/bottoms/news/api_news.dart';
import 'package:flutter_vk_application/bottoms/news/displaying_news.dart';
import 'package:flutter_vk_application/bottoms/news/model.dart';

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
    final categoryNews = await apiCategoryNews.getNews(widget.categoryName);
    _categoryNews = categoryNews;
    setState(() {
      _loading = false;
    });
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

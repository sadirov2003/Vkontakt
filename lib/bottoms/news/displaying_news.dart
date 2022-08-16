import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vk_application/bottoms/news/api_news.dart';
import 'package:flutter_vk_application/bottoms/news/category_model.dart';
import 'package:flutter_vk_application/bottoms/news/data.dart';
import 'package:flutter_vk_application/bottoms/news/displaying_category_news.dart';
import 'package:flutter_vk_application/bottoms/news/model.dart';

class DisplayingNews extends StatefulWidget {
  const DisplayingNews({Key? key}) : super(key: key);

  @override
  State<DisplayingNews> createState() => _DisplayingNewsState();
}

class _DisplayingNewsState extends State<DisplayingNews> {
  List<CategoryModel> categories = [];
  final apiNews = ApiNews();
  List<NewsModel> _news = [];
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    News();
  }

  void News() async {

    final news = await apiNews.getNews();
    setState(() {
      _news = news;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Column(children: [
                Container(
                    margin: EdgeInsets.all(6),
                    height: 70,
                    child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName);
                        }),
                  ),
                
                Expanded(
                  child: ListView.builder(
                      itemCount: _news.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return BlogTile(
                          imageUrl: _news[index].urlToImage!,
                          title: _news[index].title,
                          desc: _news[index].description!,
                          url: _news[index].url,
                        );
                      }),
                ),
              ]),
            ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({
    required this.imageUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DispayingCategoryNews(categoryName: categoryName,)));
        },
      child: Container(
            margin: EdgeInsets.only(right: 6),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl,
                    width: 120, height: 60, fit: BoxFit.cover),
              ),
              Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26,
                  ),
                  child: Text(categoryName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))),
            ]),
          ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        if (imageUrl.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        SizedBox(height: 8),
        Text(title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 8),
        Text(
          desc,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ]),
    );
  }
}

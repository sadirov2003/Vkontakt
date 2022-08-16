import 'dart:convert';

import 'package:flutter_vk_application/bottoms/news/model.dart';
import 'package:http/http.dart' as http;

class ApiNews {
  Future<List<NewsModel>> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-07-09&sortBy=publishedAt&apiKey=25ef5cf4d21b4678a8a67ff27ce37a60';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Iterable list = jsonData['articles'];

      return list.map((n) => NewsModel.fromJson(n)).toList();
    } else {
      throw Exception('Призошло ошибка при получения данных');
    }
  }
}
class ApiCategoryNews {
  Future<List<NewsModel>> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=25ef5cf4d21b4678a8a67ff27ce37a60';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Iterable list = jsonData['articles'];

      return list.map((n) => NewsModel.fromJson(n)).toList();
    } else {
      throw Exception('Призошло ошибка при получения данных');
    }
  }
}


import 'dart:convert';

import 'package:flutter_vk_application/bottoms/news/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiNews {
  Future<void> getNews() async {
    final _storage = SharedPreferences.getInstance();
    final storage = await _storage;
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-08-14&sortBy=publishedAt&apiKey=25ef5cf4d21b4678a8a67ff27ce37a60';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      storage.setString('news_key', json);
    } else {
      throw Exception('Призошло ошибка при получения данных');
    }
  }
}

class ApiCategoryNews {
  Future<void> getNews(String category) async {
    final _storage = SharedPreferences.getInstance();
    final storage = await _storage;
    final apiKey = '25ef5cf4d21b4678a8a67ff27ce37a60';
    
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      storage.setString('categoryNews_key', json);
    } else {
      throw Exception('Призошло ошибка при получения данных');
    }
  }
}

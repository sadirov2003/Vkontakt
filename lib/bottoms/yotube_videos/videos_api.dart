import 'dart:convert';

import 'package:flutter_vk_application/bottoms/yotube_videos/videos_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiVideos {
  Future<List<VideosModel>> getVideos(String quer) async {
    final _storage = SharedPreferences.getInstance();
    final storage = await _storage;
    final apiKey = storage.getString('api_key');
    final uri =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=$quer&key=$apiKey';

    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      Iterable list = jsonData['items'];
      return list.map((n) => VideosModel.fromJson(n)).toList();
    } else {
      throw Exception('Призошло ошибка при получения данных');
    }
  }
}

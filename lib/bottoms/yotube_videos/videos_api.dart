import 'dart:convert';

import 'package:flutter_vk_application/bottoms/yotube_videos/videos_model.dart';
import 'package:http/http.dart' as http;

class ApiVideos {
  Future<List<VideosModel>> getVideos(String quer) async {
    final apiKey = 'AIzaSyBPeSmePYmJwsRKABz7IcomlK3BrMiieY8';
    final uri =
        'https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=$quer&maxResults=10&key=$apiKey';

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

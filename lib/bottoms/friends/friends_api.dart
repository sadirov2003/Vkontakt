import 'dart:convert';

import 'package:flutter_vk_application/bottoms/friends/friends_model.dart';
import 'package:http/http.dart' as http;

class ApiFriends {
  Future<List<FriendsModel>> getSearchFriends(String quer) async {
    final token = 'vk1.a.UjJoQac6xuUaBqDn_9-mOadBoYOemo_r6sTouTXD_64m1Gvq7ad7b1VOZaUzcmae0wgwtBGFR_1tTuLW80x9LZs0UMqi-pb7tORVarSJnp7NpN9r6NI476__6I_anOL7Lzyghs1ElIMCzgl8imKt0dsMmNJYWRA053u-4Hc3GA9jbQ4cVr0jAN0dLGZdBYfz';
    String url =
        'https://api.vk.com/method/friends.search?count=60&fields=photo_100&q=$quer&v=5.81&access_token=$token';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      Iterable list = jsonData['response']['items'];
      return list.map((n) => FriendsModel.fromJson(n)).toList();
    } else {
      throw Exception('Приозошло ошибка при получения данных');
    }
  }
}

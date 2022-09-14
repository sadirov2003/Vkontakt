import 'dart:convert';

import 'package:flutter_vk_application/bottoms/friends/friends_model.dart';
import 'package:http/http.dart' as http;

class ApiFriends {
  Future<List<FriendsModel>> getSearchFriends(String quer) async {
    final token = 'vk1.a.GAxjfvoySocx5y9bGQmJ0IvnaVAOGaIVJqXZLPAvcZs7MnjJ1rEKPSLBYHnLn3KEDq0e1RtfrlvICuycfln4yAgGuvPQCubOJNN3J09z11D0AwePvdz3I6gYVuvo3ipkohNrv9ULLnf2XAPxPJFbX-s-CWaAoeCuLcnYB7GMuvHy8xi-m8tMbkLds_U0u7mu';
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

import 'dart:convert';

import 'package:flutter_vk_application/bottoms/friends/friends_model.dart';
import 'package:http/http.dart' as http;

class ApiFriends {
  Future<List<FriendsModel>> getSearchFriends(String quer) async {
    final token = 'vk1.a.AWjc-T-nM2nf2-VZAA2FCsB7ULKNElQIUG0hLc1WYKMdeL7eu_tpYlBh9MICnxUNM5FeLIkob9dwLuYCuZWM6qG_OXow-pEpIeY7mQcDgo_UUxR6RUZrp3mJ1T0_Ow2SscdnBlQmY3TbwQaNBnjlkBdzYZ6xXHXBM3R7WdwyLMKqgKYOJuEY78qW5irLmi6a';
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

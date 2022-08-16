import 'dart:convert';

import 'package:flutter_vk_application/bottoms/friends/friends_model.dart';
import 'package:http/http.dart' as http;

class ApiFriends {
  Future<List<FriendsModel>> getSearchFriends(String quer) async {
    final token = 'vk1.a.zYZjSQ5JzFcpXnDSAfOGAJDv377NoWDMUYEiED3BJ9KXyMjtT80LZNqjPiiTcuo_JdEyiSKmIkRl5sNImB7UKGr9AsNEJXDJmOHUYyJDorSmjLc9uanvm_9PMDc1fSlCUPmY_e9qbNXc1r83YjJMrrOCwgflJfnIgtWaS8ngrY-fqGW-4Jp1JxdCs6qG0iAg';
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

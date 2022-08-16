import 'package:flutter/material.dart';
import 'package:flutter_vk_application/bottoms/friends/displaying_friends.dart';
import 'package:flutter_vk_application/bottoms/news/displaying_news.dart';
import 'package:flutter_vk_application/bottoms/yotube_videos/displaying_videos.dart';

class MyVkPage extends StatefulWidget {
  const MyVkPage({Key? key}) : super(key: key);

  @override
  State<MyVkPage> createState() => _MyVkPageState();
}

class _MyVkPageState extends State<MyVkPage> {
  int _selectedTab = 2;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вконтакт', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          DisplayingNews(),
          DisplayingFriends(),
          DisplayingVideos(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), label: 'Друзья', backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Фильмы'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_vk_application/pages/my_vk_pages.dart';
import 'package:flutter_vk_application/widgets_auth/first_main_screen.dart';

import 'package:flutter_vk_application/widgets_auth/second_main_screen.dart';
import 'package:flutter_vk_application/widgets_auth/third_main_screen.dart';

void main() {
  runApp(MyApp());
  print('add');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
      routes: {
        '/': (context) => FirstMainScreen(),
        '/secondMainScreen': (context) => SecondMainScreen(),
        '/thirdMainScreen': (context) => ThirdMainScreen(),
        '/myVkPage': (context) => MyVkPage(),
      },
      initialRoute: '/myVkPage',
    );
  }
}

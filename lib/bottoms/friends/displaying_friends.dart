import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vk_application/bottoms/friends/friends_api.dart';
import 'package:flutter_vk_application/bottoms/friends/friends_model.dart';
import 'package:flutter_vk_application/bottoms/friends/icons/my_app_icons.dart';

class DisplayingFriends extends StatefulWidget {
  const DisplayingFriends({Key? key}) : super(key: key);

  @override
  State<DisplayingFriends> createState() => _DisplayingFriendsState();
}

class _DisplayingFriendsState extends State<DisplayingFriends> {
  final apiFriends = ApiFriends();
  List<FriendsModel> _searchFriends = [];
  bool _loading = true;

  final _searchController = TextEditingController();

  void getFriends() async {
    final query = _searchController.text;
    final friends = await apiFriends.getSearchFriends(query);
    _searchFriends = friends;
    setState(() {
      _loading = false;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFriends();

    _searchController.addListener(getFriends);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Поиск',
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemCount: _searchFriends.length,
                      itemBuilder: (BuildContext context, int index) {
                        final model = _searchFriends[index];
                        return Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(model.photo_100),
                                    // maxRadius: 35,
                                    radius: 30,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    width: 226,
                                    child: Row(
                                      children: [
                                        Text(
                                          model.first_name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          model.last_name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 27.7),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.message,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

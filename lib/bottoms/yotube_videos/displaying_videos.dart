import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vk_application/bottoms/yotube_videos/playing_videos.dart';
import 'package:flutter_vk_application/bottoms/yotube_videos/videos_api.dart';
import 'package:flutter_vk_application/bottoms/yotube_videos/videos_model.dart';


class DisplayingVideos extends StatefulWidget {
  const DisplayingVideos({Key? key}) : super(key: key);

  @override
  State<DisplayingVideos> createState() => _DisplayingVideosState();
}

class _DisplayingVideosState extends State<DisplayingVideos> {
  final apiVideos = ApiVideos();
  List<VideosModel> _video = [];
  bool _loading = true;
  final _searchController = TextEditingController();

  void get() async {
    final quer = _searchController.text;
    final videos = await apiVideos.getVideos(quer);
    _video = videos;
    
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
    _searchController.addListener(get);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  child: SafeArea(
                    child: ListView.builder(
                        itemCount: _video.length,
                        itemBuilder: (BuildContext context, int index) {
                          final model = _video[index];
                          return Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              children: [
                                if (model.urlImage.isNotEmpty)
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      //primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PlayingVideos(
                                              youtubeKey: model.videoId!),
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: AspectRatio(
                                        aspectRatio: 570 / 320,
                                        child: Container(
                                          height: 320,
                                          width: 320,
                                          decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            //alignment: FractionalOffset.topCenter,
                                            image: new NetworkImage(
                                                model.urlImage),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                SizedBox(height: 5),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    //primary: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    model.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                //SizedBox(height: 5)
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
    );
  }
}

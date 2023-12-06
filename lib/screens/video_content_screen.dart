import 'package:flutter/material.dart';
import '../../app_utils/utilities.dart';
import '../../screens/video_player_screen.dart';

class VideoContentScreen extends StatefulWidget {
  const VideoContentScreen({super.key});

  @override
  State<VideoContentScreen> createState() => _VideoContentScreenState();
}

class _VideoContentScreenState extends State<VideoContentScreen> {
  List<Map<String, dynamic>> videoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData("assets/data/videos.json").then((value) {
      if (value != null) {
        setState(() {
          videoList = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack.withOpacity(0.7),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VideoPlayerScreen(
                                videoPath:
                                    'assets/Video/${videoList[index]['id']}.mp4');
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/VideoCover/video-${videoList[index]['id']}.jpg',
                                height: 90,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                              const Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: colorWhite,
                                  size: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                videoList[index]['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: colorLightGreen,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                videoList[index]['headline'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: colorWhite,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: colorWhite,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: colorGrey.withOpacity(0.2),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}

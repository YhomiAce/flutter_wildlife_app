import 'package:flutter/material.dart';
import '../../app_utils/utilities.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((value) {
        setState(() {
          _videoPlayerController.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        title: const Text('VideoPlayer'),
        backgroundColor: colorBlack,
        foregroundColor: colorWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : Container(),
          VideoProgressIndicator(
            _videoPlayerController,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: colorWhite,
              bufferedColor: colorBlack,
              playedColor: colorYellowAccent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(colorYellowAccent),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(70, 70)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                ),
                onPressed: () {
                  _videoPlayerController.play();
                },
                child: const Icon(
                  Icons.play_arrow,
                  color: colorBlack,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(70, 70)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                ),
                onPressed: () {
                  _videoPlayerController.pause();
                },
                child: const Icon(
                  Icons.pause,
                  color: colorBlack,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(70, 70)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
                ),
                onPressed: () {
                  _videoPlayerController.seekTo(
                    Duration(
                        seconds:
                            _videoPlayerController.value.position.inSeconds +
                                10),
                  );
                },
                child: const Icon(
                  Icons.fast_forward,
                  color: colorBlack,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:chewie/image_by_roomcd.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ImageByRoomCdContainer extends StatefulWidget {
//  @override
//  ImageByRoomCdContainerState createState() {
//    return new ImageByRoomCdContainerState();
//  }

  @override
  _VideoAppState createState() => _VideoAppState();
}

class ImageByRoomCdContainerState extends State<ImageByRoomCdContainer> {
  @override
  Widget build(BuildContext context) {
    return ImageByRoomCd();
  }
}


class _VideoAppState extends State<ImageByRoomCdContainer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
//        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController _videoController;

void showImage(BuildContext context, String image) {
  final pageRoute = MaterialPageRoute(builder: (context) {
    return WillPopScope(
      child: Stack(children: <Widget>[
        _buildView(image),
        GestureDetector(
            onTap: () {
              _dispose();
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(top: 35.0, left: 15.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 27.0,
                  color: Colors.grey[50],
                )))
      ]),
      onWillPop: () {
        _dispose();
        return new Future.value(true);
      },
    );
  });
  Navigator.of(context).push(pageRoute);
}

Widget _buildView(String image) {
  //todo fix bug: can not pause video after exit fullscreen
  return Chewie(
    _videoController = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    aspectRatio: 3 / 2,
    autoPlay: true,
  );
}

void _dispose() {
  _videoController?.pause();
}

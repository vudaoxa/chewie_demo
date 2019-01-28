import 'package:chewie/media.dart';
import 'package:flutter/material.dart';

class ImageByRoomCd extends StatefulWidget {

  @override
  State createState() => ImageByRoomCdState();
}

class ImageByRoomCdState extends State<ImageByRoomCd> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        child: new GestureDetector(
          onTap: () => showImage(context, ""),
          child: new Text(
            "Click to play",
          ),
        ));
  }
}

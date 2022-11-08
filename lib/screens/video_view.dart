import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({
    super.key,
    required this.path,
  });

  final String path;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  @override
  // void initState() {
  //   super.initState();
  //   print(File(widget.path));
  //   _controller = VideoPlayerController.asset(widget.path);
  //   print("Controller value");
  //   print(_controller);

  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize().then((_) => setState(() {}));
  //   _controller.play();
  // }
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        print(_controller);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.crop_rotate,
              size: 27,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 27,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.title,
              size: 27,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 27,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 180,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                      // child: Stack(
                      //   alignment: Alignment.bottomCenter,
                      //   children: <Widget>[
                      //     VideoPlayer(_controller),
                      //     VideoProgressIndicator(_controller,
                      //         allowScrubbing: true),
                      //   ],
                      // ),
                    )
                  : Container(
                      color: Colors.yellow,
                    ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      size: 27,
                      color: Colors.white,
                    ),
                    suffixIcon: CircleAvatar(
                      backgroundColor: Colors.tealAccent[700],
                      radius: 27,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    hintText: "Add caption.....",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

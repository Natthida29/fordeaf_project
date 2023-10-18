import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPages extends StatefulWidget {
  const VideoPages({super.key});

  @override
  State<VideoPages> createState() => _VideoPagesState();
}

class _VideoPagesState extends State<VideoPages> {
  late VideoPlayerController _videoPlayerController;
  late File _video;
  ImagePicker picker = ImagePicker();
  _pickVideo() async{
    final video = await picker.getVideo(source: ImageSource.gallery);
    _video = File(video!.path);
    _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_) {
      setState(() {
        
      });
      _videoPlayerController.play();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Demo'),
        ),
        body: Column(
          children: [
            if(_video != null)
            _videoPlayerController.value.isInitialized ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            ):Container()
            else
              Text('Click Video'),
            ElevatedButton(
              onPressed: (){
                _pickVideo();
              },
              child: Text('PickVideo')
            )
          ],
        ),
      ),
    );
  }
}
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp_clone/screens/camera_view.dart';
import 'package:whatsapp_clone/screens/video_view.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  String videoPath = "";

  void takePhoto(BuildContext context) async {
    final imagePath =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile image = await _cameraController.takePicture();
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => CameraView(
          path: image.path,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(_cameraController),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          // final imagePath = join(
                          //     (await getTemporaryDirectory()).path,
                          //     "${DateTime.now()}.png");
                          _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                            // videoPath = imagePath;
                          });
                        },
                        onLongPressUp: () async {
                          XFile video =
                              await _cameraController.stopVideoRecording();
                          final fileName = basename(video.path);
                          setState(() {
                            isRecording = false;
                            videoPath = fileName;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => VideoView(path: videoPath),
                            ),
                          );
                        },
                        onTap: () {
                          if (!isRecording) {
                            takePhoto(context);
                          }
                        },
                        child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

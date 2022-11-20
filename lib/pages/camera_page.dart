import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      onImageSend: () {},
    );
  }
}

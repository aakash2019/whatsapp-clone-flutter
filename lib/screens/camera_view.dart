import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({
    super.key,
    required this.path,
  });

  final String path;

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
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
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

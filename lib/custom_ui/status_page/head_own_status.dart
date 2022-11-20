import 'package:flutter/material.dart';

class HeadOwnStatusCard extends StatelessWidget {
  const HeadOwnStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/balram.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent[200],
              radius: 10,
              child: Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "My Status",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

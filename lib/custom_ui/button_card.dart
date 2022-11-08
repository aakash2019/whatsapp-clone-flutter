import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 62, 223, 67),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

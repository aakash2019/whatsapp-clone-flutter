import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom_ui/custom_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Dev Stack",
      icon: "person.svg",
      isGroup: false,
      time: '4:00',
      currentMessage: "Hey Everyone",
    ),
    ChatModel(
      name: "Aakash",
      icon: "person.svg",
      isGroup: false,
      time: '5:00',
      currentMessage: "Hey Aakash",
    ),
    ChatModel(
      name: "Nitin",
      icon: "person.svg",
      isGroup: false,
      time: '2:00',
      currentMessage: "Hey Nitin",
    ),
    ChatModel(
      name: "Anime ke 14",
      icon: "group.svg",
      isGroup: true,
      time: '12:00',
      currentMessage: "Hey Anime ke 14o",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => SelectContact(),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}

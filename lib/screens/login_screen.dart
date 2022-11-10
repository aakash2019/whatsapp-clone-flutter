import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom_ui/button_card.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';

import '../model/chat_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
      name: "Dev Stack",
      icon: "person.svg",
      isGroup: false,
      time: '4:00',
      currentMessage: "Hey Everyone",
      id: 1,
    ),
    ChatModel(
      name: "Aakash",
      icon: "person.svg",
      isGroup: false,
      time: '5:00',
      currentMessage: "Hey Aakash",
      id: 2,
    ),
    ChatModel(
      name: "Nitin",
      icon: "person.svg",
      isGroup: false,
      time: '2:00',
      currentMessage: "Hey Nitin",
      id: 3,
    ),
    ChatModel(
      name: "Anime ke 14",
      icon: "person.svg",
      isGroup: false,
      time: '12:00',
      currentMessage: "Hey Anime ke 14o",
      id: 4,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              sourceChat = chatModels.removeAt(index);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) => HomeScreen(
                    chatModels: chatModels,
                    sourceChat: sourceChat,
                  ),
                ),
              );
            },
            child:
                ButtonCard(name: chatModels[index].name, icon: Icons.person)),
      ),
    );
  }
}

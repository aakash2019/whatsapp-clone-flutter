import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom_ui/avatar_card.dart';
import 'package:whatsapp_clone/custom_ui/button_card.dart';
import 'package:whatsapp_clone/custom_ui/contact_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", status: "A Full Stack Developer"),
    ChatModel(name: "Aakash", status: "India"),
    ChatModel(name: "Nitin", status: "Canada"),
    ChatModel(name: "Ankit", status: "Australia"),
    ChatModel(name: "Vasudev", status: "United Kingdom"),
    ChatModel(name: "Harsh", status: "Melbourne"),
    ChatModel(name: "Dev Stack", status: "A Full Stack Developer"),
    ChatModel(name: "Aakash", status: "India"),
    ChatModel(name: "Nitin", status: "Canada"),
    ChatModel(name: "Ankit", status: "Australia"),
    ChatModel(name: "Vasudev", status: "United Kingdom"),
    ChatModel(name: "Harsh", status: "Melbourne"),
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 90 : 0,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].select == true) {
                    setState(() {
                      groups.remove(contacts[index - 1]);
                      contacts[index - 1].select = false;
                    });
                  } else {
                    setState(() {
                      groups.add(contacts[index - 1]);
                      contacts[index - 1].select = true;
                    });
                  }
                },
                child: ContactCard(contact: contacts[index - 1]),
              );
            },
          ),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: contacts.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child: AvatarCard(contact: contacts[index]));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

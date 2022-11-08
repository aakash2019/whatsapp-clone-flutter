import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom_ui/button_card.dart';
import 'package:whatsapp_clone/custom_ui/contact_card.dart';
import 'package:whatsapp_clone/model/chat_model.dart';
import 'package:whatsapp_clone/screens/create_group.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "295 contacts",
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
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "Invite a friend",
                  ),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text(
                    "Contacts",
                  ),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text(
                    "Refresh",
                  ),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text(
                    "Help",
                  ),
                  value: "Help",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => CreateGroup(),
                    ),
                  );
                },
                child: ButtonCard(
                  name: "New group",
                  icon: Icons.group_add,
                ),
              );
            } else if (index == 1) {
              return ButtonCard(
                name: "New contact",
                icon: Icons.person_add_alt_1_sharp,
              );
            }
            return ContactCard(contact: contacts[index - 2]);
          }),
    );
  }
}

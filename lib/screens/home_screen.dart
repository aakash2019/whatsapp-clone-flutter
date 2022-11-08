import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/camera_page.dart';
import 'package:whatsapp_clone/pages/chat_page.dart';
import 'package:whatsapp_clone/screens/create_group.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Whatsapp Clone',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => CreateGroup(),
                        ),
                      );
                    },
                    child: Text(
                      "New group",
                    ),
                  ),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text(
                    "New broadcast",
                  ),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text(
                    "Whatsapp Web",
                  ),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text(
                    "Starred messages",
                  ),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text(
                    "Settings",
                  ),
                  value: "Settings",
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(),
          Text('Staus'),
          Text('Calls'),
        ],
      ),
    );
  }
}

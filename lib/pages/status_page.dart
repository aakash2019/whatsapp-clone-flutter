import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custom_ui/status_page/head_own_status.dart';
import 'package:whatsapp_clone/custom_ui/status_page/others_status_card.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            child: FloatingActionButton(
              elevation: 8,
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(height: 13),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[200],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            HeadOwnStatusCard(),
            label("Recent updates"),
            OthersStatusCard(
              name: "Aakash",
              time: "06:30 pm",
              imageName: "assets/2.jpeg",
              isSeen: false,
              statusNum: 2,
            ),
            OthersStatusCard(
              name: "Nitin",
              time: "07:30 pm",
              imageName: "assets/3.jpg",
              isSeen: false,
              statusNum: 3,
            ),
            OthersStatusCard(
              name: "Ankit",
              time: "02:10 am",
              imageName: "assets/1.jpg",
              isSeen: false,
              statusNum: 20,
            ),
            OthersStatusCard(
              name: "Harsh",
              time: "10:45 am",
              imageName: "assets/balram.jpg",
              isSeen: false,
              statusNum: 5,
            ),
            SizedBox(
              height: 10,
            ),
            label("Viewed updates"),
            OthersStatusCard(
              name: "Aakash",
              time: "06:30 pm",
              imageName: "assets/2.jpeg",
              isSeen: true,
              statusNum: 2,
            ),
            OthersStatusCard(
              name: "Nitin",
              time: "07:30 pm",
              imageName: "assets/3.jpg",
              isSeen: true,
              statusNum: 2,
            ),
            OthersStatusCard(
              name: "Ankit",
              time: "02:10 am",
              imageName: "assets/1.jpg",
              isSeen: true,
              statusNum: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

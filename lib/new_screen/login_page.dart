import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/country_model.dart';
import 'package:whatsapp_clone/new_screen/country_page.dart';
import 'package:whatsapp_clone/new_screen/otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = 'India';
  String countryCode = '+91';
  TextEditingController _controller = TextEditingController();

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "New group",
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "WhatsApp will send an sms message to verify your number",
              style: TextStyle(
                fontSize: 13.5,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "What's my number?",
              style: TextStyle(
                fontSize: 12.8,
                color: Colors.cyan[800],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            countryCard(),
            SizedBox(
              height: 5,
            ),
            number(),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: () {
                if (_controller.text.length == 0) {
                  wrongNumberDialogAlert("Please enter a valid number");
                } else if (_controller.text.length == 10) {
                  successfulNumberDialog();
                } else {
                  wrongNumberDialogAlert("You entered an invalid number");
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.tealAccent[400],
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => CountryPage(
              setCountryData: setCountryData,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(
          vertical: 5,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    countryName,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "+",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  countryCode.substring(1),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8,
                ),
              ),
            ),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone number",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> successfulNumberDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "We will be verifying your phone number",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  countryCode + " " + _controller.text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Is this Ok, or would you like to edit the number?",
                  style: TextStyle(
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Colors.tealAccent[400],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => OtpScreen(
                      number: _controller.text,
                      countryCode: countryCode.substring(1),
                    ),
                  ),
                );
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: Colors.tealAccent[400],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> wrongNumberDialogAlert(String alert) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  alert,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: Colors.tealAccent[400],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

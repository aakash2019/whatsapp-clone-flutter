import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/chat_model.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                widget.chatModel.isGroup
                    ? "assets/groups.svg"
                    : "assets/person.svg",
                color: Colors.white,
                height: 37,
                width: 37,
              ),
            ),
          ],
        ),
        titleSpacing: 0,
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'last seen today at 12:05',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.videocam,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
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
                    "View Contact",
                  ),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text(
                    "Media, links, and docs",
                  ),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text(
                    "Search",
                  ),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text(
                    "Mute Notifications",
                  ),
                  value: "Mute Notifications",
                ),
                PopupMenuItem(
                  child: Text(
                    "Wallpaper",
                  ),
                  value: "Wallpaper",
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                            margin: EdgeInsets.only(
                              left: 2,
                              right: 2,
                              bottom: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                prefixIcon: IconButton(
                                  icon: Icon(Icons.emoji_emotions),
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet(),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                            right: 2.0,
                            left: 2.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF128C7E),
                            radius: 25,
                            child: IconButton(
                              icon: Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    show
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: emojiSelect(),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    "Document",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.camera_alt,
                    Colors.pink,
                    "Camera",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.insert_photo,
                    Colors.purple,
                    "Gallery",
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.headset,
                    Colors.orange,
                    "Audio",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.location_pin,
                    Color.fromARGB(255, 5, 112, 23),
                    "Location",
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(
                    Icons.person,
                    Colors.blue,
                    "Contact",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {
        print(text);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        print(emoji);
        setState(() {
          _controller.text = _controller.text + emoji!.emoji;
        });
        print(_controller.text);
      },
      onBackspacePressed: () {},
      textEditingController: _controller,
      config: const Config(
        columns: 7,
        // emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ), // Needs to be const Widget
        loadingIndicator: const SizedBox.shrink(), // Needs to be const Widget
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}

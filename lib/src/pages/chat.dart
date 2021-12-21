import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/domain/controller/Chatcontroller.dart';
import 'package:flutter_application_1/domain/models/message.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  ChatController chatController = Get.find();
  AuthController authenticationController = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    chatController.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    chatController.stop();
    super.dispose();
  }

  Widget _item(Message element, int posicion, String uid) {
    logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
    return Card(
      margin: EdgeInsets.all(4.0),
      color: uid == element.user ? Colors.orange[600] : Colors.grey[800],
      child: ListTile(
        onTap: () => chatController.updateMsg(element),
        onLongPress: () => chatController.deleteMsg(element, posicion),
        title: Text(uid == element.user ? 'tú' : element.user,
            style: TextStyle(color: Colors.grey[200], fontSize: 13),
            textAlign: uid == element.user ? TextAlign.right : TextAlign.left,
            
            ),
        subtitle: Text(
          element.text,
          textAlign: uid == element.user ? TextAlign.right : TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _list() {
    String uid = authenticationController.getName();
    print('Current user $uid');
    return GetX<ChatController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      return ListView.builder(
        itemCount: chatController.messages.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = chatController.messages[index];
          return _item(element, index, uid);
        },
      );
    });
  }

  Future<void> _sendMsg(String text) async {
    //FocusScope.of(context).requestFocus(FocusNode());
    logInfo("Calling _sendMsg with $text");
    await chatController.sendMsg(text);
  }

  Widget _textInput() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 5.0, top: 5.0),
            child: TextField(
              key: const Key('MsgTextField'),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your message',
                focusColor: Colors.orange,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.grey,
              ),
              onSubmitted: (value) {
                _sendMsg(_controller.text);
                _controller.clear();
              },
              controller: _controller,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                key: const Key('sendButton'),
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _sendMsg(_controller.text);
                  _controller.clear();
                }))
      ],
    );
  }

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    return Container(
      child: Column(
        children: [Expanded(flex: 4, child: _list()), _textInput()],
      ),
    );
  }
}

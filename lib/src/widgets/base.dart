import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/chat.dart';

class Base extends StatefulWidget {
  Base({
    Key? key,
  }) : super(key: key);

  @override
  _Base createState() => _Base();
}

class _Base extends State<Base> {
  String _status = '';
  int _numPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'ANIMESTER',
              style: TextStyle(color: Colors.orange),
            ),
            centerTitle: true,
            backgroundColor: Colors.black),
        // body: funcion,
        //  body: ListView(
        //  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        //  children: [_createInput(), Divider(), _creatStatus()],
        //  ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _numPage = index;
            });
          },
          currentIndex: _numPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.account_circle_rounded),
                label: "perfil"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.emoji_emotions_outlined),
                label: "estados"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.bungalow_rounded),
                label: "home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.explore),
                label: "ubicacion"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: "chat"),
          ],
          // backgroundColor: Colors.black,
          fixedColor: Colors.orange,
        ),
        backgroundColor: Colors.grey.shade900);
  }

  Widget _createBody() {
    return Container();
  }
}

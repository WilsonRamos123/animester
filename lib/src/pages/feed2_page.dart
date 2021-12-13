import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/chat.dart';
import 'package:flutter_application_1/src/pages/feed_page.dart';
import 'package:flutter_application_1/src/pages/home.dart';
import 'package:flutter_application_1/src/pages/ubicacion.dart';

import 'perfil.dart';

class Feed2 extends StatefulWidget {
  Feed2({Key? key}) : super(key: key);

  @override
  _Feed2 createState() => _Feed2();
}

class _Feed2 extends State<Feed2> {
  String _status = '';
  int _numPage = 2;
  List<Widget> _paginas = [Perfil(), Feed(), Home(), Ubicacion(), Chat()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text(
              'ANIMESTER',
              style: TextStyle(color: Colors.orange),
            ),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: _paginas[_numPage],
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

  // Widget _createInput() {
  //   return TextField(
  //     style: TextStyle(color: Colors.white),
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       fillColor: Colors.white,
  //       hintText: '¿Qué estás pensando?',
  //       hintStyle: TextStyle(color: Colors.grey),
  //       icon: Icon(
  //         Icons.account_circle,
  //         size: 50,
  //         color: Colors.grey,
  //       ),
  //     ),
  //     onChanged: (String value) {
  //       setState(() {
  //         _status = value;
  //       });
  //     },
  //   );
  // }

  // Widget _creatStatus() {
  //   return ListTile(
  //     title: Text(
  //       "Tu estado es: $_status",
  //       style: TextStyle(color: Colors.grey),
  //     ),
  //   );
  // }
}

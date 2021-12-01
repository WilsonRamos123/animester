import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'ANIMASTER',
              style: TextStyle(color: Colors.orange),
            ),
            centerTitle: true,
            backgroundColor: Colors.black),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [_createInput(), Divider(), _creatStatus()],
        ),
        backgroundColor: Colors.grey.shade900);
  }

  Widget _createInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        hintText: '¿Qué estás pensando?',
        hintStyle: TextStyle(color: Colors.grey),
        icon: Icon(
          Icons.account_circle,
          size: 50,
          color: Colors.grey,
        ),
      ),
      onChanged: (String value) {
        setState(() {
          _status = value;
        });
      },
    );
  }

  Widget _creatStatus() {
    return ListTile(
      title: Text(
        "Tu estado es: $_status",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

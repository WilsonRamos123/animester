import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/textcontroller.dart';
import 'package:get/get.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  TextController controller = Get.find();
  String _status = '';
  final estado = TextEditingController();
  String state = "";
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      children: [_createInput(), Divider(), _creatStatus()],
    );
  }

  Widget _createInput() {
    return TextField(
      controller: estado,
      onTap: () => estado.text = '',
      onSubmitted: (value) => controller.updateText(_status),
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        hintText: '¿Como te sientes?',
        hintStyle: TextStyle(color: Colors.grey),
        icon: Icon(
          Icons.account_circle,
          size: 50,
          color: Colors.grey,
        ),
        // suffixIcon: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 6.0),
        //   child: Icon(
        //     Icons.send_rounded,
        //   ),
        // ),
      ),
      onChanged: (String value) {
        setState(() {
          _status = value;
        });
      },
    );
  }

  Widget _creatStatus() {
    return Obx(
      () => ListTile(
        title: Text(
          "Tu estado es: ${controller.text}",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

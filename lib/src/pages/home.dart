import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/domain/controller/textcontroller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  TextController controller = Get.find();
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    final perfil_state = TextEditingController();
    String _status = '';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [_creatStatus(), Divider()],
      ),
      // child: TextField(
      //   controller: perfil_state,
      //   style: TextStyle(color: Colors.white),
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //     fillColor: Colors.white,
      //     hintText: '¿Que estas pensando?',
      //     hintStyle: TextStyle(color: Colors.grey),
      //     icon: Icon(
      //       Icons.account_circle,
      //       size: 50,
      //       color: Colors.grey,
      //     ),
      //   ),
      //   onChanged: (String value) {
      //     setState(() {
      //       _status = value;
      //     });
      //   },
      // ),
    );
  }

  Widget _creatStatus() {
    return Obx(() => Card(
        elevation: 10,
        color: Colors.black,
        child: Column(
          children: [
            Container(
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                title: Text(
                  "${authController.email}\n\nTu ultimo estado fue: \n\n${controller.text}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    //backgroundColor: Colors.grey[400],
                  ),
                ),
              ),
            )
          ],
        )));
  }
}

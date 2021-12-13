import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:get/get.dart';

class Perfil extends StatefulWidget {
  const Perfil({
    Key? key,
  }) : super(key: key);

  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    String _status = '';
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ElevatedButton(
              onPressed: () async {
                await authController.logOut();
                if (authController.logInStatus()==false) {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const Text('Log out'),
              style: ElevatedButton.styleFrom(primary: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}

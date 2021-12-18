import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController authController = Get.find();
  String _email = '';
  String _password = '';
  String _name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Text(
                  'ANIMESTER',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                )),
            Text(
              "Registro",
              style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nombre",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name here',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _name = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Correo",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contraseña",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your password here',
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: ElevatedButton(
                onPressed: () {
                  print(
                      'name: $_name \n email: $_email \n password: $_password');
                  authController.signUp(_email, _password);
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Registrarse'),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ),
            Column(
              children: [
                Text("¿Ya tienes cuenta?",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[500],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Colors.grey.shade900,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        "Iniciar Sesion",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700),
                      ),
                    ))
              ],
            )
          ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        )),
        // backgroundColor: Colors.blueGrey.shade200
        backgroundColor: Colors.grey.shade900);
  }
}

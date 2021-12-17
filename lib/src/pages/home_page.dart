import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = Get.find();
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: Text(
                  'ANIMESTER4',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 50,
                      fontWeight: FontWeight.w500),
                )),
            Text(
              "Iniciar Sesión",
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
                            "Correo",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _email = value;
                            print(_email);
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
                              fillColor: Colors.grey),
                          onChanged: (String value) {
                            setState(() {
                              _password = value;
                              print(_password);
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
                onPressed: () async {
                  await authController.login(_email, _password);
                  if (authController.logInStatus()) {
                    Navigator.pushNamed(context, 'feed2');
                  } else {
                    print('Rectifica tus credenciales');
                  }
                },
                child: const Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ),
            Column(
              children: [
                Text("¿No tienes cuenta?",
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
                        Navigator.pushNamed(context, 'register');
                      },
                      child: const Text(
                        "Registrate",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700),
                      ),
                    ))
                // Text(
                //   "Regístrate",
                //   style: TextStyle(
                //       fontSize: 17,
                //       color: Colors.orange,
                //       fontWeight: FontWeight.w700),
                // )
              ],
            )
          ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        ),
        // backgroundColor: Colors.blueGrey.shade200
        backgroundColor: Colors.grey.shade900);
  }
}

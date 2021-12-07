import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email address',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your password here',
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.grey),
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'feed2');
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

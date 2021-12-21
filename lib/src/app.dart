import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/src/pages/chat.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';
import 'package:flutter_application_1/src/pages/ubicacion.dart';
import 'package:flutter_application_1/src/pages/vistagps.dart';
import 'pages/feed2_page.dart';
import 'package:get/get.dart';

import 'pages/settings.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _inizialization = Firebase.initializeApp();
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Container(
      child: FutureBuilder(
          future: _inizialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('error: ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Get.put(AuthController());
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (FirebaseAuth.instance.currentUser != null) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      initialRoute: '/',
                      routes: <String, WidgetBuilder>{
                        'settings': (BuildContext context) => Settings(),
                        'feed2': (BuildContext context) => Feed2(),
                        'chat': (BuildContext context) => Chat(),
                        '/': (BuildContext context) => HomePage(),
                        'ubicacion': (BuildContext context) => Ubicacion(),
                        'register': (BuildContext context) => RegisterPage(),
                        'vistagps': (BuildContext context) => vistagps(),
                      },
                    );
                  } else {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      initialRoute: '/',
                      routes: <String, WidgetBuilder>{
                        'settings': (BuildContext context) => Settings(),
                        'feed2': (BuildContext context) => Feed2(),
                        '/': (BuildContext context) => HomePage(),
                        'register': (BuildContext context) => RegisterPage(),
                        'ubicacion': (BuildContext context) => Ubicacion(),
                      },
                    );
                  }
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    ));
  }
}

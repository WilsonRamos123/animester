import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/chat.dart';
import 'package:flutter_application_1/src/pages/feed_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';
import 'pages/feed2_page.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _inizialization = Firebase.initializeApp();
  @override
  Widget build(context) {
    return MaterialApp(

        // home: Center(
        //   child: HomePage(),
        // ),
        // home: FutureBuilder(
        //   future: _inizialization,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if(snapshot.hasError){
        //       print('error ${snapshot.error}');

        //     }
        //   },
        // ),
        home: Scaffold(
      body: FutureBuilder(
          future: _inizialization,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => HomePage(),
                'register': (BuildContext context) => RegisterPage(),
                'feed2': (BuildContext context) => Feed2(),
                'chat': (BuildContext context) => Chat(),
              },
            );
          }),
    ));
  }
}

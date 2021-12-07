import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/chat.dart';
import 'package:flutter_application_1/src/pages/feed_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/register_page.dart';

import 'pages/feed2_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Center(
      //   child: HomePage(),
      // ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'register': (BuildContext context) => RegisterPage(),
        'feed2': (BuildContext context) => Feed2(),
        'chat': (BuildContext context) => Chat(),
      },
    );
  }
}

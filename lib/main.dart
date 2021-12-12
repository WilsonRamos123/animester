import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:get/get.dart';
import 'domain/controller/textcontroller.dart';
import 'domain/controller/Authcontroller.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<TextController>(() => TextController());
  Get.lazyPut<AuthController>(() => AuthController());
  runApp(new MyApp());
}

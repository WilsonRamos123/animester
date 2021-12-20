import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Chatcontroller.dart';
import 'package:flutter_application_1/domain/controller/Firestorecontroller.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:get/get.dart';
import 'domain/controller/preferencecontroller.dart';
import 'domain/controller/textcontroller.dart';
import 'domain/controller/Authcontroller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut<TextController>(() => TextController());
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<FirebaseController>(() => FirebaseController());
  Get.lazyPut<ChatController>(() => ChatController());
  Get.lazyPut<PreferenceController>(() => PreferenceController());

  runApp(new MyApp());
}

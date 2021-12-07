import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:get/get.dart';

import 'domain/controller/textcontroller.dart';

void main() {
  Get.lazyPut<TextController>(() => TextController());

  runApp(new MyApp());
}

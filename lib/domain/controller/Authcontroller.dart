import 'package:flutter_application_1/domain/text.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = "".obs;


  void updateUser(String user) {
    //1. Llama el metodo adjustValue y envía los parametros necesarios
    email.value = user;
    //2. Llama el metodo dec2bin y envía los parametros necesarios
    //_binary.value = Converter.bin2dec(text.value);
  }

  void reset() {
    email.value = "";
    //   text.value = "0";
  }
}

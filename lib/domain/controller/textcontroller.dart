import 'package:flutter_application_1/domain/text.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  var text = "".obs;
  var estado = "".obs;

  String get decimal => text.value;
  String get binary => estado.value;

  void updateText(String n_text) {
    //1. Llama el metodo adjustValue y envía los parametros necesarios
    text.value = Text.adjustValue(text.value, n_text);
    //2. Llama el metodo dec2bin y envía los parametros necesarios
    //_binary.value = Converter.bin2dec(text.value);
  }

  // void updateBinary(int text) {
  //   //1. Llama el metodo adjustValue y envía los parametros necesarios
  //   //_binary.value = Converter.adjustValue(_binary.value, text);
  //   //2. Llama el metodo bin2dec y envía los parametros necesarios
  //   text.value = Converter.bin2dec(_binary.value);
  // }

  void reset() {
    text.value = "";
    //   text.value = "0";
  }
}

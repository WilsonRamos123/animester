class Text {
  static String adjustValue(String oldValue, String newText) {
    String newValue;
    if (oldValue == "") {
      newValue = "$newText";
      //oldValue = "";
    } else {
      newValue = " $newText\n\n";
    }
    return newValue;
  }

  // // Añade el codigo necesario para realizar el proceso
  // // de convertir de binario a decimal
  // static String bin2dec(String binary) {
  //   return int.parse(binary, radix: 2).toRadixString(10);
  // }

  // // Añade el codigo necesario para realizar el proceso
  // // de convertir de decimal a binario
  // static String dec2bin(String decimal) {
  //   return int.parse(decimal, radix: 10).toRadixString(2);
  // }
}

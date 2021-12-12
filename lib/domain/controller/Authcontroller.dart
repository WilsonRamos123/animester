
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/models/user.dart';

class AuthController extends GetxController {
  var email = "".obs;
  void updateUser(String user) {
    email.value = user;
  }
  void reset() {
    email.value = "";
    //   text.value = "0";
  }

  //*************************TRUE CODE*********************************
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  User _userFromFirebaseUser(FirebaseUser user){} 


// sign in as Anon
// Future signInAnon()async {
//   try{

//   }catch(e){

//   }
// }
  // sign in 
  

}

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'preferencecontroller.dart';

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
  Future<void> login(theEmail, thePassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: theEmail, password: thePassword);
      print("ok");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("NOK 1");
        return Future.error("User not found");
      } else if (e.code == 'wrong password') {
        print('NOK 2');
        return Future.error('wrong password');
      }
    }
    print('NOK');
  }

  Future<void> signUp(email, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  PreferenceController preferencesController = Get.find();
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error(e.toString());
    }
    preferencesController.save_data2(false);
  }

  bool logInStatus() {
    return FirebaseAuth.instance.currentUser != null;
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }
  String getName() {
    String uid = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return uid.split('@')[0];
  }
}

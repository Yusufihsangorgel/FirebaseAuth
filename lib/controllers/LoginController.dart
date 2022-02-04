import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/HomeScreen.dart';
import 'package:todo/screens/TodoScreen.dart';

class LoginController extends GetxController {
  Login(username, password) async {
    print("mail: " + username + " " + "şifre: " + password);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username.toString(),
        password: password.toString(),
      );

      print("Firebase email : " + userCredential.user!.email.toString());
      if (userCredential.user!.email == username) {
        Get.to(HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      print("firebase error : " + e.code.toString());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } on Exception catch (e) {
      print("my error : " + e.toString());
    }
  }
}

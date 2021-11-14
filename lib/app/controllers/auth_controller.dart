import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get stream_auth_status => auth.authStateChanges();

  // method untuk signup
  void signup(String param_email, param_password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: param_email,
        password: param_password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // method untuk Login
  void login(String param_email, param_password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: param_email,
        password: param_password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No User found');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  // method untuk Logout
  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}

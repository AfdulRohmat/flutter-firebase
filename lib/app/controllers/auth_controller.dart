import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get stream_auth_status => auth.authStateChanges();

  // method untuk signup
  void signup(String param_email, param_password) async {
    try {
      UserCredential userTrySignup =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: param_email,
        password: param_password,
      );

      await userTrySignup.user!.sendEmailVerification();

      Get.defaultDialog(
        title: 'Verifikasi Email',
        middleText: 'Kami telah mengirimkan verifikasi akun ke email anda',
        onConfirm: () {
          Get.back(); //back dari Get dialog
          Get.back(); // back ke login page
        },
        textConfirm: 'Oke',
      );
      //
      //
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'The password provided is too weak.',
        );
        print('The password provided is too weak.');
        //
        //
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'The account already exists for that email.',
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Terjadi kesalahan',
      );
      print(e);
    }
  }

  // method untuk Login
  void login(String param_email, param_password) async {
    try {
      UserCredential userTryLogin = await auth.signInWithEmailAndPassword(
        email: param_email,
        password: param_password,
      );

      if (userTryLogin.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
        //
        //
      } else {
        await userTryLogin.user!.sendEmailVerification();
        Get.defaultDialog(
          title: 'Verifikasi Email',
          middleText:
              'Perlu verifikasi email untuk login. Kami sudah mengirim kode verifikasi ke email anda',
          onConfirm: () => Get.back(),
          textConfirm: 'Oke',
        );
        //

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'No User found',
        );
        print('No User found');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Wrong password provided for that user.',
        );
        print('Wrong password provided for that user.');
      }
    }
  }

  // method untuk Logout
  void logout() {
    Get.defaultDialog(
      title: 'LOGOUT',
      middleText: 'Anda yakin ingin logout ?',
      onConfirm: () async {
        await auth.signOut();
        Get.offAllNamed(Routes.LOGIN);
      },
      textConfirm: 'iya',
      textCancel: 'tidak',
    );
  }

  // method untuk Reset Password
  void resetPassword(param_email) async {
    if (param_email != "" && GetUtils.isEmail(param_email)) {
      try {
        await auth.sendPasswordResetEmail(email: param_email);
        Get.defaultDialog(
          title: 'BERHASIL',
          middleText:
              'Kami telah mengirimkan reset Password ke Email $param_email',
          onConfirm: () {
            Get.back(); // back to reset page
            Get.back(); // back to login page
          },
          textConfirm: 'oke',
        );
      } catch (e) {
        Get.defaultDialog(
          title: 'ERROR',
          middleText: 'Terjadi Kesalahan',
          textConfirm: 'oke',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'ERROR',
        middleText: 'Terjadi Kesalahan',
        textConfirm: 'oke',
      );
    }
  }
}

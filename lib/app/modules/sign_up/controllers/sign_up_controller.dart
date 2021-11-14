import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController email_signUp_textEditingController = TextEditingController();

  TextEditingController password_signUp_textEditingController =
      TextEditingController();


  @override
  void onClose() {
    email_signUp_textEditingController;
    password_signUp_textEditingController;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up Screen'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              // field email
              TextField(
                controller: controller.email_signUp_textEditingController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),

              // field Password
              TextField(
                controller: controller.password_signUp_textEditingController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  auth_controller.signup(
                      controller.email_signUp_textEditingController.text,
                      controller.password_signUp_textEditingController.text);
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Sudah punya akun ?'),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

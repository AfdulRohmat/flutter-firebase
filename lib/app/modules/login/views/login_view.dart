import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              // field email
              TextField(
                controller: controller.email_signIn_textEditingController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),

              // field Password
              TextField(
                controller: controller.password_signIn_textEditingController,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  auth_controller.login(
                      controller.email_signIn_textEditingController.text,
                      controller.password_signIn_textEditingController.text);
                },
                child: Text('Login'),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Belum punya akun ?'),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGN_UP);
                    },
                    child: Text('Buat Akun'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

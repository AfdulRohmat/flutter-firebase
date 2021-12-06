import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              // field new password
              TextField(
                controller: controller.email_for_reset_TextEditingController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  auth_controller.resetPassword(
                      controller.email_for_reset_TextEditingController.text);
                },
                child: Text('Change Password'),
              ),
            ],
          ),
        ));
  }
}

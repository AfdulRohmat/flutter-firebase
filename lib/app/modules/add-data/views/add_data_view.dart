import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            // field email
            TextField(
              controller: controller.title_contr,
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),

            // field Password
            TextField(
              controller: controller.desc_contr,
              decoration: InputDecoration(
                labelText: "Description",
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.addData(
                    controller.title_contr.text, controller.desc_contr.text);
                
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}

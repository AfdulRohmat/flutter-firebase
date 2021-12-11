import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_data_controller.dart';

class EditDataView extends GetView<EditDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getDataByID(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;

            controller.title_contr.text = data['title'];
            controller.desc_contr.text = data['description'];

            return Container(
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

                  // field desc
                  TextField(
                    controller: controller.desc_contr,
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                  ),

                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      controller.editData(controller.title_contr.text,
                          controller.desc_contr.text, Get.arguments);
                    },
                    child: Text('Edit Data'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteData(Get.arguments);
                    },
                    child: Text('Delete Data'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

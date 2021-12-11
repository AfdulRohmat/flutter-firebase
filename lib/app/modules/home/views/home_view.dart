import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final auth_controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              auth_controller.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),

      // REALTIME READ DATA
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.getDataRealtime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    "${(data[index].data() as Map<String, dynamic>)['title']}"),
                subtitle: Text(
                    "${(data[index].data() as Map<String, dynamic>)['description']}"),
                onTap: () {
                  Get.toNamed(
                    Routes.EDIT_DATA,
                    arguments: data[index].id,
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      // ONE TIME READ DATA
      // FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.getDataOnce(),
      //   builder: (context, snapshot) {
      //     print(snapshot.data);
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var data = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: data.length,
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text(
      //               "${(data[index].data() as Map<String, dynamic>)['title']}"),
      //           subtitle: Text(
      //               "${(data[index].data() as Map<String, dynamic>)['description']}"),
      //         ),
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_DATA);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

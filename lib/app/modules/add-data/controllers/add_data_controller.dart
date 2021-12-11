import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataController extends GetxController {
  TextEditingController title_contr = TextEditingController();
  TextEditingController desc_contr = TextEditingController();

  // instansiasi firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // method add data
  void addData(String title_param, String desc_param) async {
    //instance CollectionReference
    CollectionReference datas = FirebaseFirestore.instance.collection('datas');

    try {
      String dateNow = DateTime.now().toString();

      await datas.add(
        {
          "title": title_param,
          "description": desc_param,
          "time": dateNow,
        },
      );

      Get.defaultDialog(
        title: 'BERHASIL',
        middleText: 'Data berhasil ditambahkan',
        onConfirm: () {
          title_contr.clear();
          desc_contr.clear();
          Get.back();
        },
        textConfirm: 'ok',
      );
      //
      //
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Terjadi kesalahan. Silahkan coba lagi',
        onConfirm: () => Get.back(),
        textConfirm: 'Ok',
      );
    }
  }

  @override
  void onInit() {
    title_contr;
    desc_contr;
    super.onInit();
  }

  @override
  void onClose() {
    title_contr;
    desc_contr;
    super.onClose();
  }
}

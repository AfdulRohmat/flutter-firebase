import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDataController extends GetxController {
  TextEditingController title_contr = TextEditingController();
  TextEditingController desc_contr = TextEditingController();

  // instansiasi firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Method Get Data By ID
  Future<DocumentSnapshot<Object?>> getDataByID(String docs_id_param) async {
    DocumentReference documentReference =
        firestore.collection('datas').doc(docs_id_param);

    return documentReference.get();
  }

  // Method Edit Data
  Future<void> editData(
      String title_param, String desc_param, String docs_id_param) async {
    //
    //
    DocumentReference documentReference_datas =
        FirebaseFirestore.instance.collection('datas').doc(docs_id_param);

    try {
      await documentReference_datas.update(
        {
          "title": title_param,
          "description": desc_param,
        },
      );

      Get.defaultDialog(
        title: 'BERHASIL',
        middleText: 'Data berhasil diedit',
        onConfirm: () {
          title_contr.clear();
          desc_contr.clear();
          Get.back();
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

  // Method Delete Data
  Future<void> deleteData(String docs_id_param) async {
    //
    //
    DocumentReference documentReference_datas =
        FirebaseFirestore.instance.collection('datas').doc(docs_id_param);

    try {
      Get.defaultDialog(
        title: 'DELETE DATA',
        middleText: 'Anda Yakin ingin Menghapus data ?',
        onConfirm: () async {
          await documentReference_datas.delete();
          title_contr.clear();
          desc_contr.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'ok',
        textCancel: 'tidak',
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

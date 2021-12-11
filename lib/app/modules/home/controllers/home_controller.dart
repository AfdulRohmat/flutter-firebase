import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // instansiasi firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // One Time read data
  Future<QuerySnapshot<Object?>> getDataOnce() async {
    CollectionReference datas = FirebaseFirestore.instance.collection('datas');

    return datas.get();
  }

  // Realtime read data
  Stream<QuerySnapshot<Object?>> getDataRealtime() {
    CollectionReference datas = FirebaseFirestore.instance.collection('datas');

    return datas
        .orderBy(
          "time",
        )
        .snapshots();
  }
}

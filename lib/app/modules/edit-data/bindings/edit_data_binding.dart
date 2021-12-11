import 'package:get/get.dart';

import '../controllers/edit_data_controller.dart';

class EditDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDataController>(
      () => EditDataController(),
    );
  }
}

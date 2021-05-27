import 'package:get/get.dart';

import '../controllers/vista_previa_controller.dart';

class VistaPreviaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VistaPreviaController>(
      () => VistaPreviaController(),
    );
  }
}

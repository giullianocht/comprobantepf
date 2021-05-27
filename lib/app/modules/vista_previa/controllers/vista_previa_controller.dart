import 'package:get/get.dart';

import 'package:comprobante/app/data/models/Comprobante.dart';

class VistaPreviaController extends GetxController {
  var comprobante = Get.arguments as Comprobante;
  //var comprobante = Comprobante("Mateo", "0983342745", "Giulliano", 10);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

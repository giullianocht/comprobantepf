import 'package:get/get.dart';

import 'package:comprobante/app/data/models/Comprobante.dart';

class VistaPreviaController extends GetxController {
  var comprobante = Get.arguments as Comprobante;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    print(comprobante.nombre);
    print(comprobante.telefono);
    print(comprobante.vendedor);
    print(comprobante.identificador);

    super.onReady();
  }

  @override
  void onClose() {}
}

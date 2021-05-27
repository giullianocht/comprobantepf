import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var nombreInputController = TextEditingController(text: "");
  var telefonoInputController = TextEditingController(text: "");
  var vendedorInputController = TextEditingController(text: "");
  var formKey = GlobalKey<FormState>();

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

  String? validator(String? value) {
    if (value == null) {
      return "Campo obligatorio";
    }
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
  }

  String? validatorTel(String? value) {
    if (value == null) {
      return "Campo obligatorio";
    }
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    if (!value.isNumericOnly) {
      return "Este campo debe ser numérico";
    }
    if (value.length != 10) {
      return "Este campo debe tener 10 números";
    }
  }

  void pregunta() {
    var nombre = nombreInputController.text;
    var tel = telefonoInputController.text;
    var vendedor = vendedorInputController.text;

    Get.defaultDialog(
      title: "\nConfirmar Datos",
      content: Container(
        height: Get.mediaQuery.size.height * 0.35,
        width: Get.mediaQuery.size.width * 0.70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nombre: $nombre"),
              Text("Teléfono: $tel"),
              Text("Vendedor: $vendedor"),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: Get.mediaQuery.size.width * 0.1,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

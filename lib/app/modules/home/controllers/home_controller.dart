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
}

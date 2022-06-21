import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:comprobante/app/data/models/Comprobante.dart';
import 'package:comprobante/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var nombreInputController = TextEditingController(text: "");
  var telefonoInputController = TextEditingController(text: "");
  var vendedorInputController = TextEditingController(text: "");
  var numeroInputController = TextEditingController(text: "");
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
    return null;
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
    return null;
  }

  String? validatorNum(String? value) {
    if (value == null) {
      return "Campo obligatorio";
    }
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    if (!value.isNumericOnly) {
      return "Este campo debe ser numérico";
    }
    var valor = int.tryParse(value);
    if (valor != null) {
      if (valor <= 0) {
        return "Debe ser mayor a 0";
      }
    } else {
      return "Este campo debe ser numérico";
    }
    return null;
  }

  void _irVistaPrevia(Comprobante comprobante) {
    unfocus();

    Get.back();
    Get.toNamed(
      Routes.VISTA_PREVIA,
      arguments: comprobante,
    );
  }

  void pregunta() {
    var nombre = nombreInputController.text;
    var tel = telefonoInputController.text;
    var vendedor = vendedorInputController.text;
    var numero = numeroInputController.text;

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
              Text("Número: $numero"),
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
          onPressed: () {
            _irVistaPrevia(
              Comprobante(
                nombre,
                tel,
                vendedor,
                int.parse(numero),
              ),
            );
          },
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  void clearAll() {
    nombreInputController.clear();
    telefonoInputController.clear();
    vendedorInputController.clear();
    numeroInputController.clear();
  }

  void clearNumero() {
    numeroInputController.clear();
  }

  void unfocus() {
    if (Get.focusScope != null) {
      Get.focusScope!.unfocus();
    }
  }
}

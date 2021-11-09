import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:comprobante/app/modules/home/controllers/home_controller.dart';
import 'package:comprobante/app/modules/vista_previa/controllers/vista_previa_controller.dart';

class VistaPreviaView extends GetView<VistaPreviaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Generada"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Get.mediaQuery.size.width * 0.05),
            child: Material(
              color: Get.theme.primaryColor,
              child: TextButton(
                onPressed: () {
                  try {
                    Get.find<HomeController>().clearNumero();
                    Get.back();
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "Crear Otro",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: Get.mediaQuery.size.height * 0.75,
          width: Get.mediaQuery.size.width * 0.95,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: AssetImage(
                  "assets/base-rifa.png",
                ),
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _text(
                    "Nombre",
                    controller.comprobante.nombre,
                    25.0,
                  ),
                  _text(
                    "Teléfono",
                    controller.comprobante.telefono,
                    25.0,
                  ),
                  _text(
                    "Vendedor",
                    controller.comprobante.vendedor,
                    25.0,
                  ),
                  _text(
                    "Precio",
                    "10.000 GS",
                    25.0,
                  ),
                  _text(
                    "Número",
                    controller.comprobante.numero.toString(),
                    25.0,
                  ),
                ],
              ),
              Positioned(
                bottom: 5.0,
                child: Text(
                  "<ID:${controller.comprobante.identificador}>",
                  style: TextStyle(
                    fontSize: 8.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String titulo, String dato, double size) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "$titulo: $dato",
        style: TextStyle(
          fontSize: size,
          color: Get.theme.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

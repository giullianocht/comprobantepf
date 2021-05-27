import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vista_previa_controller.dart';

class VistaPreviaView extends GetView<VistaPreviaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista Previa"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 540,
          width: 540,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: AssetImage(
                  "assets/base-rifa.png",
                ),
                fit: BoxFit.cover,
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
                    "Identificador",
                    controller.comprobante.identificador,
                    15.0,
                  ),
                ],
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
        ),
      ),
    );
  }
}

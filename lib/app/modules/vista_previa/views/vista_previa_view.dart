import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vista_previa_controller.dart';

class VistaPreviaView extends GetView<VistaPreviaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VistaPreviaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.comprobante.nombre,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

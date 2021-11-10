import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:comprobante/app/modules/home/controllers/home_controller.dart';
import 'package:comprobante/app/modules/vista_previa/controllers/vista_previa_controller.dart';

class VistaPreviaView extends GetView<VistaPreviaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista Previa"),
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
        child: controller.imageToPreview(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.shareImage();
        },
        backgroundColor: Colors.orange[800],
        child: Icon(
          Icons.share,
        ),
      ),
    );
  }
}

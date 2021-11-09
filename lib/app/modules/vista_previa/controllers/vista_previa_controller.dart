import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:comprobante/app/data/models/Comprobante.dart';

class VistaPreviaController extends GetxController {
  ScreenshotController screenshotController = ScreenshotController();

  var comprobante = Get.arguments as Comprobante;

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

  void dialogoCargando() {
    if (Get.isDialogOpen != null && !Get.isDialogOpen!) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  void dialogoCargandoCerrar() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  void shareImage() async {
    dialogoCargando();

    var image = await screenshotController.captureFromWidget(imageToShare());

    final directory = await getApplicationDocumentsDirectory();

    final imagePath = await File('${directory.path}/image.png').create();
    await imagePath.writeAsBytes(image);

    await Share.shareFiles([imagePath.path]);

    dialogoCargandoCerrar();
  }

  Widget imageToShare() {
    return _createImage(1080, 1080);
  }

  Widget imageToPreview() {
    return _createImage(
      Get.mediaQuery.size.height * 0.75,
      Get.mediaQuery.size.width * 0.95,
    );
  }

  Widget _createImage(double height, double width) {
    var imageAsset = AssetImage(
      "assets/base-rifa.png",
    );
    var image = Image(
      image: imageAsset,
      fit: BoxFit.fill,
    );
    return Center(
      child: Container(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            image,
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _text(
                  "Nombre",
                  comprobante.nombre,
                  25.0,
                ),
                _text(
                  "Teléfono",
                  comprobante.telefono,
                  25.0,
                ),
                _text(
                  "Vendedor",
                  comprobante.vendedor,
                  25.0,
                ),
                _text(
                  "Precio",
                  "10.000 GS",
                  25.0,
                ),
                _text(
                  "Número",
                  comprobante.numero.toString(),
                  25.0,
                ),
              ],
            ),
            Positioned(
              bottom: 5.0,
              child: Text(
                "<ID:${comprobante.identificador}>",
                style: TextStyle(
                  fontSize: 8.0,
                ),
              ),
            ),
          ],
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

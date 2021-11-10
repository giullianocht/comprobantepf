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

    var pixelRatio = Get.mediaQuery.devicePixelRatio;

    var image = await screenshotController.captureFromWidget(
      imageToShare(),
      pixelRatio: pixelRatio,
    );

    final directory = await getApplicationDocumentsDirectory();

    final imagePath = await File('${directory.path}/image.png').create();
    await imagePath.writeAsBytes(image);

    await Share.shareFiles([imagePath.path]);

    dialogoCargandoCerrar();
  }

  Widget imageToShare() {
    return _createImage(
      1080,
      1080,
    );
  }

  Widget imageToPreview() {
    return _createImage(
      1080,
      1080,
    );
  }

  Widget _createImage(double height, double width) {
    var imageAsset = AssetImage(
      "assets/base-rifa.png",
    );
    var image = Image(
      image: imageAsset,
    );

    return _imageBody(image);
  }

  Widget _imageBody(Image image) {
    var base = 100.0;
    var espacio = 45.0;
    return Stack(
      children: [
        image,
        _text(
          "Nombre",
          comprobante.nombre,
          17.0,
          base,
        ),
        _text(
          "Teléfono",
          comprobante.telefono,
          17.0,
          base + espacio,
        ),
        _text(
          "Vendedor",
          comprobante.vendedor,
          17.0,
          base + (espacio * 2),
        ),
        _text(
          "Precio",
          "10.000 GS",
          17.0,
          base + (espacio * 3),
        ),
        _text(
          "Número",
          comprobante.numero.toString(),
          17.0,
          base + (espacio * 4),
        ),
      ],
    );
  }

  Widget _text(String titulo, String dato, double size, double espacio) {
    return Padding(
      padding: EdgeInsets.only(top: espacio, left: 10.0),
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

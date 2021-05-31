import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.unfocus();
      },
      child: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Comprobante Rifa'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: Get.mediaQuery.size.height * 0.60,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 25.0,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _nombreField,
                      _telField,
                      _vendedorField,
                      _numField,
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
              bottom: Get.mediaQuery.size.height * 0.1,
            ),
            child: ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState != null) {
                  if (controller.formKey.currentState!.validate()) {
                    controller.pregunta();
                  }
                }
              },
              child: Text("GENERAR COMPROBANTE"),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  TextFormField get _nombreField => TextFormField(
        controller: controller.nombreInputController,
        decoration: InputDecoration(
          labelText: "Nombre del comprador",
        ),
        validator: controller.validator,
      );

  TextFormField get _telField => TextFormField(
        controller: controller.telefonoInputController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Teléfono del comprador",
          hintText: "Ej: 0983342745",
        ),
        validator: controller.validatorTel,
      );

  TextFormField get _vendedorField => TextFormField(
        controller: controller.vendedorInputController,
        decoration: InputDecoration(
          labelText: "Nombre del vendedor",
        ),
        validator: controller.validator,
      );
  TextFormField get _numField => TextFormField(
        controller: controller.numeroInputController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Número de boleta",
        ),
        validator: controller.validatorNum,
      );
}

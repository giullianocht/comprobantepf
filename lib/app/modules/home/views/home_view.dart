import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Comprobante'),
        centerTitle: true,
      ),
      body: Container(
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState != null) {
            if (controller.formKey.currentState!.validate()) {
              controller.pregunta();
            }
          }
        },
        child: Text("GENERAR"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  TextFormField get _nombreField => TextFormField(
        controller: controller.nombreInputController,
        decoration: InputDecoration(
          labelText: "Nombre",
        ),
        validator: controller.validator,
      );

  TextFormField get _telField => TextFormField(
        controller: controller.telefonoInputController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: "Teléfono",
        ),
        validator: controller.validatorTel,
      );

  TextFormField get _vendedorField => TextFormField(
        controller: controller.vendedorInputController,
        decoration: InputDecoration(
          labelText: "Vendedor",
        ),
        validator: controller.validator,
      );
}

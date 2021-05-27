import 'dart:convert';

import 'package:crypto/crypto.dart';

class Comprobante {
  final String nombre;
  final String telefono;
  final String vendedor;
  late String identificador;

  Comprobante(this.nombre, this.telefono, this.vendedor) {
    var passHash =
        sha256.convert(utf8.encode(nombre + telefono + vendedor + "ALBRECHT"));
    this.identificador = passHash.toString();
  }
}

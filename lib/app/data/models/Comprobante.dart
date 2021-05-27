import 'dart:convert';

import 'package:crypto/crypto.dart';

class Comprobante {
  final String nombre;
  final String telefono;
  final String vendedor;
  final int numero;
  late String identificador;

  Comprobante(this.nombre, this.telefono, this.vendedor, this.numero) {
    var passHash = sha256.convert(utf8
        .encode(nombre + telefono + vendedor + numero.toString() + "ALBRECHT"));
    this.identificador = passHash.toString();
  }
}

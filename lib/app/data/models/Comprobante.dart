import 'package:uuid/uuid.dart';

class Comprobante {
  final String nombre;
  final String telefono;
  final String vendedor;
  late String identificador;

  Comprobante(this.nombre, this.telefono, this.vendedor) {
    this.identificador = Uuid().v4();
  }
}

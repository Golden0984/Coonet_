import 'dart:convert';
import 'package:http/http.dart' as http;

class Pagos {
  final String? id_pago;
  final String titulo;
  final String plan;
  final String precio;
  final String fecha;

  Pagos({
    required this.id_pago,
    required this.titulo,
    required this.plan,
    required this.precio,
    required this.fecha,
  });

  factory Pagos.fromJson(Map json) {
    return Pagos(
      id_pago: json['id_pago'],
      titulo: json['titulo'],
      plan: json['plan'],
      precio: json['precio'],
      fecha: json['fecha'],
    );
  }
}

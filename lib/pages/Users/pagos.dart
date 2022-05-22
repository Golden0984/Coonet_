import 'dart:convert';
import 'package:http/http.dart' as http;

class Anuncios {
  final String id_pago;
  final String titulo;
  final String plan;
  final String precio;

  Anuncios({
    required this.id_pago,
    required this.titulo,
    required this.plan,
    required this.precio,
  });

  factory Anuncios.fromJson(Map json) {
    return Anuncios(
      id_pago: json['id_pago'],
      titulo: json['titulo'],
      plan: json['plan'],
      precio: json['precio'],
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
class Anuncios {
  late final String id_anuncio;
  final String nombre;
  final String email;
  final String titulo;
  final String descripcion;
  final String categoria;
  final String precio;
  final String foto1;
  final String foto2;
  

  Anuncios({
    required this.id_anuncio,
    required this.nombre,
    required this.email,
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.precio,
    required this.foto1,
    required this.foto2,
  });

  factory Anuncios.fromJson(Map json) {
    return Anuncios(
      id_anuncio: json['id'],
      nombre: json['nombre'],
      email: json['correo_electronico'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      categoria: json['categoria'],
      precio: json['precio'],
      foto1: json['foto1'],
      foto2: json['foto2'],
    );
  }
}



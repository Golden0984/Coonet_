import 'dart:convert';
import 'package:http/http.dart' as http;

class Anuncios {
  late final String id_anuncio;
  final String nombre;
  final String email;
  final String titulo;
  final String descripcion;
  final String categoria;
  final String descripcion_E;
  final String precio_E;
  final String descripcion_S;
  final String precio_S;
  final String descripcion_P;
  final String precio_P;
  final String valoracion_G;
  final String foto_user;
  final String foto1;
  final String foto2;

  Anuncios({
    required this.id_anuncio,
    required this.nombre,
    required this.email,
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.descripcion_E,
    required this.precio_E,
    required this.descripcion_S,
    required this.precio_S,
    required this.descripcion_P,
    required this.precio_P,
    required this.valoracion_G,
    required this.foto_user,
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
      descripcion_E: json['descripcion_E'],
      precio_E: json['precio_E'],
      descripcion_S: json['descripcion_S'],
      precio_S: json['precio_S'],
      descripcion_P: json['descripcion_P'],
      precio_P: json['precio_P'],
      valoracion_G: json['valoracion_G'],
      foto_user: json['foto_user'],
      foto1: json['foto1'],
      foto2: json['foto2'],
    );
  }
}

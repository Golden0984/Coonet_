import 'dart:convert';
import 'package:http/http.dart' as http;
class Anuncios {
  final String id_anuncio;
  final String email;
  final String titulo;
  final String descripcion;
  final String categoria;
  final String precio;
  final String foto1;
  

  Anuncios({
    required this.id_anuncio,
    required this.email,
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.precio,
    required this.foto1,
  });

  factory Anuncios.fromJson(Map json) {
    return Anuncios(
      id_anuncio: json['id'],
      email: json['correo_electronico'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      categoria: json['categoria'],
      precio: json['precio'],
      foto1: json['foto1'],
      
    );
  }
}



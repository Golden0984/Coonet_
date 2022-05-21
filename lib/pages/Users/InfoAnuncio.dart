import 'dart:convert';

import 'package:http/http.dart' as http;

class InfoAnuncio {
  String? id;
  String? nombre;
  String? correoElectronico;
  String? titulo;
  String? descripcion;
  String? categoria;
  String? descripcion_E;
  String? precio_E;
  String? descripcion_S;
  String? precio_S;
  String? descripcion_P;
  String? precio_P;
  String? valoracion_G;
  String? foto_user;
  String? foto1;
  String? foto2;
  String? foto3;
  String? foto4;

  InfoAnuncio(
      {this.id,
      this.nombre,
      this.correoElectronico,
      this.titulo,
      this.descripcion,
      this.categoria,
      this.descripcion_E,
      this.precio_E,
      this.descripcion_S,
      this.precio_S,
      this.descripcion_P,
      this.precio_P,
      this.valoracion_G,
      this.foto_user,
      this.foto1,
      this.foto2,
      this.foto3,
      this.foto4});

  InfoAnuncio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    correoElectronico = json['correo_electronico'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    categoria = json['categoria'];
    descripcion_E = json['descripcion_E'];
    precio_E = json['precio_E'];
    descripcion_S = json['descripcion_S'];
    precio_S = json['precio_S'];
    descripcion_P = json['descripcion_P'];
    precio_P = json['precio_P'];
    valoracion_G = json['valoracion_G'];
    foto_user = json['foto_user'];
    foto1 = json['foto1'];
    foto2 = json['foto2'];
    foto3 = json['foto3'];
    foto4 = json['foto4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['correo_electronico'] = this.correoElectronico;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['categoria'] = this.categoria;
    data['descripcion_E'] = this.descripcion_E;
    data['precio_E'] = this.precio_E;
    data['descripcion_S'] = this.descripcion_S;
    data['precio_S'] = this.precio_S;
    data['descripcion_P'] = this.descripcion_P;
    data['precio_P'] = this.precio_P;
    data['valoracion_G'] = this.valoracion_G;
    data['foto_user'] = this.foto_user;
    data['foto1'] = this.foto1;
    data['foto2'] = this.foto2;
    data['foto3'] = this.foto3;
    data['foto4'] = this.foto4;
    return data;
  }
}

String id_anuncio = "";
String titulo = "";
String descripcion = "";
String categoria = "";
String descripcion_E = "";
String precio_E = "";
String descripcion_S = "";
String precio_S = "";
String descripcion_P = "";
String precio_P = "";
String valoracion_G = "";
String foto_user = "";
String foto1 = "";
String foto2 = "";
String foto3 = "";
String foto4 = "";

Future<InfoAnuncio> fetchINFO(String id) async {
  var data = {"id_anuncio": id};
  var url = Uri.parse(
      'https://phpninjahosting.com/manish/Coonet/Php/InfoAnuncio.php');
  final response = await http.post(url, body: data);

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return InfoAnuncio.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

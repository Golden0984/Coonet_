import 'dart:convert';
import 'package:http/http.dart' as http;

class Valoracion {
  String? id;
  String? comentario;
  String? estrellas;
  String? idComprar;
  String? idUser;
  String? idAnuncio;
  String? nombre;
  String? correoElectronico;
  String? titulo;
  String? descripcion;
  String? categoria;
  String? descripcionE;
  String? precioE;
  String? descripcionS;
  String? precioS;
  String? descripcionP;
  String? precioP;
  String? valoracionG;
  String? fotoUser;
  String? foto1;
  String? foto2;
  String? foto3;
  String? foto4;

  Valoracion(
      {this.id,
      this.comentario,
      this.estrellas,
      this.idComprar,
      this.idUser,
      this.idAnuncio,
      this.nombre,
      this.correoElectronico,
      this.titulo,
      this.descripcion,
      this.categoria,
      this.descripcionE,
      this.precioE,
      this.descripcionS,
      this.precioS,
      this.descripcionP,
      this.precioP,
      this.valoracionG,
      this.fotoUser,
      this.foto1,
      this.foto2,
      this.foto3,
      this.foto4});

  Valoracion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comentario = json['comentario'];
    estrellas = json['estrellas'];
    idComprar = json['id_comprar'];
    idUser = json['id_user'];
    idAnuncio = json['id_anuncio'];
    nombre = json['nombre'];
    correoElectronico = json['correo_electronico'];
    titulo = json['titulo'];
    descripcion = json['descripcion'];
    categoria = json['categoria'];
    descripcionE = json['descripcion_E'];
    precioE = json['precio_E'];
    descripcionS = json['descripcion_S'];
    precioS = json['precio_S'];
    descripcionP = json['descripcion_P'];
    precioP = json['precio_P'];
    valoracionG = json['valoracion_G'];
    fotoUser = json['foto_user'];
    foto1 = json['foto1'];
    foto2 = json['foto2'];
    foto3 = json['foto3'];
    foto4 = json['foto4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comentario'] = this.comentario;
    data['estrellas'] = this.estrellas;
    data['id_comprar'] = this.idComprar;
    data['id_user'] = this.idUser;
    data['id_anuncio'] = this.idAnuncio;
    data['nombre'] = this.nombre;
    data['correo_electronico'] = this.correoElectronico;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['categoria'] = this.categoria;
    data['descripcion_E'] = this.descripcionE;
    data['precio_E'] = this.precioE;
    data['descripcion_S'] = this.descripcionS;
    data['precio_S'] = this.precioS;
    data['descripcion_P'] = this.descripcionP;
    data['precio_P'] = this.precioP;
    data['valoracion_G'] = this.valoracionG;
    data['foto_user'] = this.fotoUser;
    data['foto1'] = this.foto1;
    data['foto2'] = this.foto2;
    data['foto3'] = this.foto3;
    data['foto4'] = this.foto4;
    return data;
  }
}

Future<Valoracion> fetchValoracion(String id_compra) async {
  var data = {"id_compra": id_compra};
  var url =
      Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/Valoracion.php');
  final response = await http.post(url, body: data);

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return Valoracion.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

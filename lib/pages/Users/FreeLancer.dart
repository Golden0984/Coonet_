import 'dart:convert';
import 'package:http/http.dart' as http;

class FreeLan {
  final String id;
  final String nombre;
  final String apellido;
  final String user;
  final String correo;
  late final String telefono;

  FreeLan({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.user,
    required this.correo,
    required this.telefono,
  });

  factory FreeLan.fromJson(Map json) {
    return FreeLan(
      id: json['id'],
      nombre: json['Nombre'] as String,
      apellido: json['Apellido'] as String,
      user: json['usuario_freelancer'] as String,
      correo: json['correo_electronico'] as String,
      telefono: json['numero_telefono'] as String,
    );
  }
}

String login = "";
Future<FreeLan> fetchPost() async {
  var data = {"email": login};
  var url =
      Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/UserInfo.php');
  final response = await http.post(url, body: data);

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return FreeLan.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}
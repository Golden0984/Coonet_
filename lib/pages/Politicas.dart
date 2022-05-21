import 'dart:convert';

import 'package:coonet/pages/PaginaHome.dart';
import 'package:coonet/pages/PaginaRegistro.dart';
import 'package:coonet/pages/PreguntaSeguridad.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'CorreoRecuperacion.dart';
import 'Menu.dart';
import 'RecuperarContra.dart';
import 'Users/FreeLancer.dart';

class Politicas extends StatefulWidget {
  static String id = 'login_page';

  @override
  _PoliticasState createState() => _PoliticasState();
}

class _PoliticasState extends State<Politicas> {
  late TextEditingController emailctrl = TextEditingController(),
      passctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text('Politicas y Servicios',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: Image.asset(
                'images/logo.png',
                height: 50.0,
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            _userTextField(),
            const SizedBox(
              height: 50.0,
            ),
            Row(children: [
              Spacer(flex: 40),
              _buttonLogin(),
              const Spacer(
                flex: 40,
              )
            ]),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var client = http.Client();
    var data = {"email": emailctrl.text, "pass": passctrl.text};
    var url =
        Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/login.php');
    var Response = await client.post(url, body: data);

    if (jsonDecode(Response.body) == "Correcto") {
      login = emailctrl.text;
      Fluttertoast.showToast(
          msg: "Se ha iniciado sesion correctamente",
          toastLength: Toast.LENGTH_SHORT);
      //Ir a otra pagina
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu()));
      }
    } else if (jsonDecode(Response.body) == "no") {
      Fluttertoast.showToast(
          msg: "El usuario y la contraseña no coinciden.",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(msg: "Ha petao", toastLength: Toast.LENGTH_SHORT);
    }
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text("Flutter hace que hermosas UIs de las aplicaciones cobren vida.\n\nPara los desarrolladores, Flutter baja la curva de aprendizaje para construir aplicaciones móviles."+
        "\n\nAcelera el desarrollo de aplicaciones móviles y reduce el costo y la complejidad de la producción de aplicaciones en iOS y Android."+
        "\n\nPara los diseñadores, Flutter ayuda a entregar la visión de diseño original sin pérdida de fidelidad ni compromisos. También actúa como una herramienta productiva de creación de prototipos."+
        "\n\nEl proposito de esta aplicación es totalmente de carácter educativo. No se enviará ningún tipo de datos a terceros. Esta aplicación se ha desarrollado como proyecto final de grado de DAM2T (Curso 21-22)"+
        "\n\nLos desarolladores de la aplicacion son Sahil Kumar, Manish Thakur y Arnau Cervera."+
        "\n\nSe reclaca que la versión de esta aplicación es una versión BETA, lo cúal quiere decir que en futuras actualizaciones, se mejorará el rendimiento y nuevas funncionalidades.", 
        style: TextStyle(color: Colors.white), textAlign: TextAlign.justify,),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 230,
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              alignment: Alignment.center,
              child: const Text(
                'Volver',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 200, 255, 0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => Navigator.of(context).pop());
    });
  }
}

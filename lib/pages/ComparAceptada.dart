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

class C_aceptar extends StatefulWidget {

  @override
  _C_aceptarState createState() => _C_aceptarState();
}

class _C_aceptarState extends State<C_aceptar> {

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
            const SizedBox(height: 40.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text('PREMIUM',
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
            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            children: [
              Text("Se ha realizado la compara correctamente.", 
              style: TextStyle(color: Colors.white, fontSize: 17), textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("¡AHORA ERES PREMIUM!", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.justify,)
            ],
          ),
        ),
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
          onPressed: () {
                        paginaActual = 4;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Menu()));
                      });
    });
  }
}

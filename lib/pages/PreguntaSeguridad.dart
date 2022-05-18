import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:coonet/pages/RecuperarContra.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'Users/FreeLancer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class PreguntaSeguridad extends StatefulWidget {
  static String id = 'Register_page';

  @override
  _PreguntaSeguridadState createState() => _PreguntaSeguridadState();
}

class _PreguntaSeguridadState extends State<PreguntaSeguridad> {

  late TextEditingController emailctrl = TextEditingController();
  late TextEditingController preguntactrl = TextEditingController();
  late TextEditingController respuestactrl = TextEditingController();

  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  verificacion() {
    if (emailctrl.text == ""){
      if(preguntactrl.text == "" && respuestactrl.text == ""){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecuperarContra()));
      }
    }
  }
  
  Dio dio = new Dio();

  Future<void> _Subir() async {

    /*String filename = _image!.path.split('/').last;

    await dio.post('https://phpninjahosting.com/manish/Coonet/Php/register.php',
    data: formData).then((value){
      if(value.toString()=='si'){
        login = emailctrl.text;
        Fluttertoast.showToast(
            msg: "se ha creado correctamnete", toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
        }
      }else if(value.toString()=='Usuario Registrado'){
        Fluttertoast.showToast(
          msg: "El Usuario ya esta Registrado",
          toastLength: Toast.LENGTH_SHORT);
      }else if(value.toString()=='Contra no coincide'){
        Fluttertoast.showToast(
          msg: "la contraseña no coinciden.", toastLength: Toast.LENGTH_SHORT);
      }else if(value.toString()=='no'){
        Fluttertoast.showToast(
          msg: "Elije una imagen", toastLength: Toast.LENGTH_SHORT);
      }else{
        print(value.toString());
      }
    });*/
  }
  
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
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                 const Text('Pregunta de seguridad',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            _emailTextField(),
            const SizedBox(
              height: 10,
            ),
            _nuevaTextField(),
            const SizedBox(
              height: 10,
            ),
            _repetirTextField(),
            const SizedBox(
              height: 30.0,
            ),
            _cambiarAhora(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: emailctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'ejemplo@email.com',
              hintStyle: TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
              labelText: 'Correo Electrónico',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _nuevaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: preguntactrl,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.question_mark,
                color: Colors.white,
              ),
              hintText: 'No es necesario introducir "¿" y "?"',
              hintStyle: TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
              labelText: 'Pregunta de Seguridad',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _repetirTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: respuestactrl,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.question_answer_outlined,
                color: Colors.white,
              ),
              //hintText: 'ejemplo@email.com',
              labelText: 'Respuesta',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

 

  Widget _cambiarAhora() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 150,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'Siguiente',
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
          onPressed: () => _Subir());
    });
  }
}

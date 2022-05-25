import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'Users/FreeLancer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class RecuperarContra extends StatefulWidget {
  static String id = 'Register_page';

  @override
  _RecuperarContraState createState() => _RecuperarContraState();
}

class _RecuperarContraState extends State<RecuperarContra> {

  late TextEditingController nuevoctrl = TextEditingController();
  late TextEditingController repetirctrl = TextEditingController();

  File? _image;

  RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*\d)[a-zA-Z\d]{8,18}$');

  bool _vacioContra = false;
  bool _vacioRepetir = false;
  bool _valContra = false;
  bool _valRepetir = false;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        print(File(pickedImage.path));
        _image = File(pickedImage.path);
        print(_image);
      });
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
            const Text('Recuperar contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 20.0,
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

  Widget _nuevaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: nuevoctrl,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: _vacioContra
                  ? 'No se puede dejar vacio'
                  : _valContra
                      ? 'Min. 8 caracteres(1 Mayus, 1 Minus & 1 Num)'
                      : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              //hintText: 'Alex',
              labelText: 'Nueva contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              nuevoctrl.text.isEmpty
                  ? _vacioContra = true
                  : _vacioContra = false;
              !regex.hasMatch(nuevoctrl.text)
                  ? _valContra = true
                  : _valContra = false;
            });
          },
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
          controller: repetirctrl,
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            errorText: _vacioRepetir
                  ? 'No se puede dejar vacio'
                  : _valRepetir
                      ? 'No coincide con la contraseña'
                      : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.repeat,
                color: Colors.white,
              ),
              //hintText: 'ejemplo@email.com',
              labelText: 'Repetir nueva contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              repetirctrl.text.isEmpty
                  ? _vacioRepetir = true
                  : _vacioRepetir = false;
              !(nuevoctrl.text == repetirctrl.text)
                  ? _valRepetir = true
                  : _valRepetir = false;
            });
          },
        ),
      );
    });
  }

 

  Widget _cambiarAhora() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 200,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'Cambiar contraseña',
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

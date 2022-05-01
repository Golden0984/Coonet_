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

class PaginaRegistro extends StatefulWidget {
  static String id = 'Register_page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<PaginaRegistro> {

  late TextEditingController nombrectrl = TextEditingController();
  late TextEditingController apellidosctrl = TextEditingController();
  late TextEditingController userctrl = TextEditingController();
  late TextEditingController telefonoctrl = TextEditingController();
  late TextEditingController emailctrl = TextEditingController();
  late TextEditingController passctrl = TextEditingController();
  late TextEditingController repeatpassctrl = TextEditingController();

  File? _image;

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

    String filename = _image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      "nombre": nombrectrl.text,
      "apellidos": apellidosctrl.text,
      "usuario": userctrl.text,
      "email": emailctrl.text,
      "tel": telefonoctrl.text,
      "pass": passctrl.text,
      "pass_valid": repeatpassctrl.text,
      'file' : await MultipartFile.fromFile(_image!.path,filename: filename)
    }
    );

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
    });
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
        child: ListView(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const Text('Registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 20.0,
            ),
            _nombreTextField(),
            const SizedBox(
              height: 10,
            ),
            _apellidosTextField(),
            const SizedBox(
              height: 10,
            ),
            _UserTextField(),
            const SizedBox(
              height: 10,
            ),
            _telefonTextField(),
            const SizedBox(
              height: 10,
            ),
            _emailTextField(),
            const SizedBox(
              height: 10,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 10,
            ),
            _repeatpasswordTextField(),
            const SizedBox(
              height: 25.0,
            ),
            _SubirImagen(),
            const SizedBox(
              height: 30.0,
            ),
            _buttonRegister(),
            const SizedBox(
              height: 25.0,
            ),
            _logearAhora(),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _nombreTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: nombrectrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.abc,
                color: Colors.white,
              ),
              //hintText: 'Alex',
              labelText: 'Nombre',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _apellidosTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: apellidosctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.abc,
                color: Colors.white,
              ),
              //hintText: 'ejemplo@email.com',
              labelText: 'Apellidos',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _UserTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: userctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              //hintText: 'ejemplo@email.com',
              labelText: 'Usuario',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _telefonTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: telefonoctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              labelText: 'Telefono',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
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
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'ejemplo@email.com',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Correo electronico',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: passctrl,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Caracteres (Min. 5 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _repeatpasswordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: repeatpassctrl,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Caracteres (Min. 5 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Repetir Contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 150,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'Reistrarse',
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

  Widget _logearAhora() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return InkWell(
        child: Row(
          children: const [
            Spacer(),
            Text(
              'Ya tienes cuenta? ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Inicar Sesion',
              style: TextStyle(color: Color.fromARGB(255, 175, 82, 206)),
            ),
            Spacer(),
          ],
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaginaLogin())),
      );
    });
  }
   Widget _SubirImagen() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              ),
              const SizedBox(width: 10),
              Center(
                child: ElevatedButton(
                  child: const Text('Select An Image'),
                  onPressed: _openImagePicker,
                ),
              ),
              
              
            ]),
          ),
        );
  }
}

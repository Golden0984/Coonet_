import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:coonet/pages/PaginaUsr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'Users/FreeLancer.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

import 'Users/InfoAnuncio.dart';

class EditarPerfil extends StatefulWidget {
  static String id = 'editarperfil_page';
  final Future<FreeLan> free;
  EditarPerfil({required this.free});
  @override
  _EditarPerfilState createState() => _EditarPerfilState(free);
}

class _EditarPerfilState extends State<EditarPerfil> {
  late TextEditingController nombrectrl = TextEditingController();
  late TextEditingController apellidosctrl = TextEditingController();
  late TextEditingController userctrl = TextEditingController();
  late TextEditingController telefonoctrl = TextEditingController();
  late TextEditingController emailctrl = TextEditingController();
  late TextEditingController passctrl = TextEditingController();
  late TextEditingController repeatpassctrl = TextEditingController();

  File? _image;

  final _picker = ImagePicker();
  final Future<FreeLan> free;
  _EditarPerfilState(this.free);

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
    if (passctrl.text.isEmpty || repeatpassctrl.text.isEmpty) {
      if (passctrl.text == repeatpassctrl.text) {
        if (_image != null) {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "correo_actual": login,
            "nombre": nombrectrl.text,
            "apellidos": apellidosctrl.text,
            "usuario": userctrl.text,
            "tel": telefonoctrl.text,
            "email": emailctrl.text,
            "pass": "no",
            "pass_valid": "no",
            'file':
                await MultipartFile.fromFile(_image!.path, filename: filename)
          });

          Update(formData);
        } else {
          FormData formData = FormData.fromMap({
            "correo_actual": login,
            "nombre": nombrectrl.text,
            "apellidos": apellidosctrl.text,
            "usuario": userctrl.text,
            "tel": telefonoctrl.text,
            "email": emailctrl.text,
            "pass": "no",
            "pass_valid": "no",
            'file': "no"
          });

          Update(formData);
        }
      }
    } else {
      if (passctrl.text == repeatpassctrl.text) {
        if (_image != null) {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "correo_actual": login,
            "nombre": nombrectrl.text,
            "apellidos": apellidosctrl.text,
            "usuario": userctrl.text,
            "tel": telefonoctrl.text,
            "email": emailctrl.text,
            "pass": passctrl.text,
            "pass_valid": repeatpassctrl.text,
            'file':
                await MultipartFile.fromFile(_image!.path, filename: filename)
          });

          Update(formData);
        } else {
          FormData formData = FormData.fromMap({
            "correo_actual": login,
            "nombre": nombrectrl.text,
            "apellidos": apellidosctrl.text,
            "usuario": userctrl.text,
            "tel": telefonoctrl.text,
            "email": emailctrl.text,
            "pass": passctrl.text,
            "pass_valid": repeatpassctrl.text,
            'file': "no"
          });

          Update(formData);
        }
      } else {
        Fluttertoast.showToast(
            msg: "La contraseña no coincide", toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

  Update(FormData formData) async {
    await dio
        .post(
            'https://phpninjahosting.com/manish/Coonet/Php/UpdateUserInfo.php',
            data: formData)
        .then((value) {
      print(value.toString());
      if (value.toString() == "hecho") {
        login = emailctrl.text;
        Fluttertoast.showToast(
            msg: "Se ha guardado correctamnete",
            toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina
        {
          paginaActual = 4;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
        }
      } else if (value.toString() == "Error") {
        Fluttertoast.showToast(
            msg: "ha sucedido un error al actualizar los datos",
            toastLength: Toast.LENGTH_SHORT);
      } else if (value.toString() == "Error Contra") {
        Fluttertoast.showToast(
            msg: "La contraseña no son iguales",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString() + "safdas");
      }
    });
  }

  @override
  void initState() {
    nombrectrl.text = nombre;
    apellidosctrl.text = apellido;
    userctrl.text = user;
    telefonoctrl.text = telefono;
    emailctrl.text = correo;
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
        child: FutureBuilder<FreeLan>(
          future: free,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            showDialog();
                          },
                        ),
                      ),
                      const Text('EDITAR PERFIL',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 130,
                    color: Color.fromARGB(49, 255, 255, 255),
                  ),
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
                  const Divider(
                    indent: 40,
                    endIndent: 40,
                    color: Color.fromARGB(135, 255, 255, 255),
                  ),
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 15),
                      child: Text('CAMBIAR CONTRASEÑA',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ))),
                  _passwordTextField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _repeatpasswordTextField(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    indent: 40,
                    endIndent: 40,
                    color: Color.fromARGB(135, 255, 255, 255),
                  ),
                  _SubirImagen(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _buttonRegister(),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.abc,
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
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
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
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
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
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
                'Guardar Cambios',
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

  Widget _SubirImagen() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
          padding:
              const EdgeInsets.only(bottom: 35, left: 35, right: 35, top: 20),
          child: Column(
            children: [
              const Text(
                "FOTO PEFIL",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 100.0,
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.network(
                              foto,
                              fit: BoxFit.cover,
                              width: 100.0,
                              height: 100.0,
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Center(
                  child: ElevatedButton(
                    child: const Text('Select An Image'),
                    onPressed: _openImagePicker,
                  ),
                ),
              ]),
            ],
          )),
    );
  }

  void showDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Descartar cambios"),
          content: Text("¿Estas seguro de salir sin guardar los cambios?"),
          actions: [
            CupertinoDialogAction(
                child: Text("SI"),
                onPressed: () {
                  paginaActual = 4;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                }),
            CupertinoDialogAction(
                child: Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}

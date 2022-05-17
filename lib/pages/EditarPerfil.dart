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
    String filename = _image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      "nombre": nombrectrl.text,
      "apellidos": apellidosctrl.text,
      "usuario": userctrl.text,
      "email": emailctrl.text,
      "tel": telefonoctrl.text,
      "pass": passctrl.text,
      "pass_valid": repeatpassctrl.text,
      'file': await MultipartFile.fromFile(_image!.path, filename: filename)
    });

    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/register.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'si') {
        login = emailctrl.text;
        Fluttertoast.showToast(
            msg: "se ha creado correctamnete", toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
        }
      } else if (value.toString() == 'Usuario Registrado') {
        Fluttertoast.showToast(
            msg: "El Usuario ya esta Registrado",
            toastLength: Toast.LENGTH_SHORT);
      } else if (value.toString() == 'Contra no coincide') {
        Fluttertoast.showToast(
            msg: "la contraseña no coinciden.",
            toastLength: Toast.LENGTH_SHORT);
      } else if (value.toString() == 'no') {
        Fluttertoast.showToast(
            msg: "Elije una imagen", toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString());
      }
    });
  }

  set() {
    FutureBuilder<FreeLan>(
      future: free,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           nombrectrl.text = "aux";
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
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
                  _nombreTextField(snapshot),
                  const SizedBox(
                    height: 10,
                  ),
                  _apellidosTextField(snapshot),
                  const SizedBox(
                    height: 10,
                  ),
                  _UserTextField(snapshot),
                  const SizedBox(
                    height: 10,
                  ),
                  _telefonTextField(snapshot),
                  const SizedBox(
                    height: 10,
                  ),
                  _emailTextField(snapshot),
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

  Widget _nombreTextField(AsyncSnapshot<FreeLan> snapshot) {
    /*var aux = snapshot.data!.nombre;
    nombrectrl.text = aux;*/
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

  Widget _apellidosTextField(AsyncSnapshot<FreeLan> snapshot) {
    var aux = snapshot.data!.apellido;
    apellidosctrl.text = aux;
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

  Widget _UserTextField(AsyncSnapshot<FreeLan> snapshot) {
    var aux = snapshot.data!.user;
    userctrl.text = aux;
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

  Widget _telefonTextField(AsyncSnapshot<FreeLan> snapshot) {
    var aux = snapshot.data!.telefono;
    telefonoctrl.text = aux;
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

  Widget _emailTextField(AsyncSnapshot<FreeLan> snapshot) {
    var aux = snapshot.data!.correo;
    emailctrl.text = aux;
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
    var aux = "Krzy";
    passctrl.text = aux;
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
    var aux = "Krzy";
    repeatpassctrl.text = aux;
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

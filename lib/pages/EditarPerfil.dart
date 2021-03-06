import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:coonet/pages/PaginaUsr.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

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

  bool _vacioNombre = false;
  bool _vacioApellido = false;
  bool _vacioUser = false;
  bool _vacioTelefono = false;
  bool _vacioEmail = false;
  bool _vacioContra = false;
  bool _vacioRepetir = false;
  bool _vacioRespuesta = false;
  bool _valUser = false;
  bool _valEmail = false;
  bool _valTel = false;
  bool _valContra = false;
  bool _valRepetir = false;

  RegExp regex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*\d)[a-zA-Z\d]{8,18}$');
  RegExp usu = RegExp(r'^(?=.*[a-z])[a-zA-Z\d]{2,}$');
  RegExp tel = RegExp(r'^[0-9]{9}$');

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

  Future<void> _Subir(String validar) async {
    if (validar == "si") {
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
              msg: "La contrase??a no coincide",
              toastLength: Toast.LENGTH_SHORT);
        }
      }
    }else{
      {
          paginaActual = 4;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
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
            msg: "La contrase??a no son iguales",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString() + "safdas");
      }
    });
  }

  Future<void> _Eliminar() async {
    FormData formData = FormData.fromMap({
      "id_perfil": id_perfil,
      "email": login,
    });
    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/EliminarUser.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'hecho') {
        Fluttertoast.showToast(
            msg: "Se ha eliminado el perfil correctamente",
            toastLength: Toast.LENGTH_SHORT);
        final client = StreamChat.of(context).client;
        client.disconnectUser();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaginaLogin()));
      } else if (value.toString() == 'Error') {
        Fluttertoast.showToast(
            msg: "Ha habido un error al eliminar el perfil",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString());
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
                      child: Text('CAMBIAR CONTRASE??A',
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
                  Row(
                    children: [Spacer(), _buttonRegister(), Spacer()],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [Spacer(), _buttonDelete(), Spacer()],
                  ),
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
          decoration: InputDecoration(
              errorText: _vacioNombre ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (nombrectrl.text.isEmpty || nombrectrl.text == " ")
                  ? _vacioNombre = true
                  : _vacioNombre = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioApellido ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (apellidosctrl.text.isEmpty || apellidosctrl.text == " ")
                  ? _vacioApellido = true
                  : _vacioApellido = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioUser
                  ? 'No se puede dejar vacio'
                  : _valUser
                      ? 'Usuario invalido'
                      : null,
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
          onChanged: (value) {
            setState(() {
              userctrl.text.isEmpty ? _vacioUser = true : _vacioUser = false;
              !usu.hasMatch(userctrl.text) ? _valUser = true : _valUser = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioTelefono
                  ? 'No se puede dejar vacio'
                  : _valTel
                      ? 'Telefono invalido'
                      : null,
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
          onChanged: (value) {
            setState(() {
              telefonoctrl.text.isEmpty
                  ? _vacioTelefono = true
                  : _vacioTelefono = false;
              !tel.hasMatch(telefonoctrl.text)
                  ? _valTel = true
                  : _valTel = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioEmail
                  ? 'No se puede dejar vacio'
                  : _valEmail
                      ? 'Correo Invalido'
                      : null,
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
          onChanged: (value) {
            setState(() {
              emailctrl.text.isEmpty ? _vacioEmail = true : _vacioEmail = false;
              !(EmailValidator.validate(emailctrl.text))
                  ? _valEmail = true
                  : _valEmail = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioContra
                  ? 'No se puede dejar vacio'
                  : _valContra
                      ? 'Min. 8 caracteres(1 Mayus, 1 Minus & 1 Num)'
                      : null,
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
              hintText: 'Caracteres (Min. 8 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Contrase??a',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              passctrl.text.isEmpty
                  ? _vacioContra = true
                  : _vacioContra = false;
              !regex.hasMatch(passctrl.text)
                  ? _valContra = true
                  : _valContra = false;
            });
          },
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
          decoration: InputDecoration(
              errorText: _vacioRepetir
                  ? 'No se puede dejar vacio'
                  : _valRepetir
                      ? 'No coincide con la contrase??a'
                      : null,
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
              hintText: 'Caracteres (Min. 8 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Repetir Contrase??a',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              repeatpassctrl.text.isEmpty
                  ? _vacioRepetir = true
                  : _vacioRepetir = false;
              !(passctrl.text == repeatpassctrl.text)
                  ? _valRepetir = true
                  : _valRepetir = false;
            });
          },
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
          onPressed: () => _Subir("si"));
    });
  }

  Widget _buttonDelete() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 150,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'ELIMINAR PERFIL',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 0, 0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            showDialogDelete();
          });
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
                              fit: BoxFit.fill,
                              width: 100.0,
                              height: 100.0,
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Center(
                  child: ElevatedButton(
                    child: const Text('Seleccionar Imagen'),
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
          title: Text("Guardar cambios"),
          content: Text("??Deseas guardar los cambios?"),
          actions: [
            CupertinoDialogAction(
                child: Text("SI"),
                onPressed: () {
                  _Subir("si");
                  Navigator.of(context).pop();
                }),
            CupertinoDialogAction(
                child: Text("NO"),
                onPressed: () {
                  _Subir("no");
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  void showDialogDelete() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("ELIMINAR PERFIL"),
          content: Text("??Estas seguro de que quieres eliminar el perfil?"),
          actions: [
            CupertinoDialogAction(
                child: Text("SI"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _Eliminar();
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

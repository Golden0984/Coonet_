import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:coonet/pages/Politicas.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
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
  late TextEditingController respuestactrl = TextEditingController();
  late bool agree = false;
  File? _image;

  String texto = "ninguna pregunta selecionado";
  String vactu = " ";
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
  RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])(?=.*\d)[a-zA-Z\d]{8,18}$');
  RegExp user = RegExp(r'^(?=.*[a-z])[a-zA-Z\d]{2,}$');
  RegExp tel = RegExp(r'^[0-9]{9}$');
  Future<void> _Subir() async {
    if (nombrectrl.text.trim().isEmpty ||
        apellidosctrl.text.trim().isEmpty ||
        userctrl.text.trim().isEmpty ||
        telefonoctrl.text.trim().isEmpty ||
        emailctrl.text.trim().isEmpty ||
        passctrl.text.trim().isEmpty ||
        repeatpassctrl.text.trim().isEmpty ||
        respuestactrl.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Hay campos en vacio", toastLength: Toast.LENGTH_SHORT);
    } else if (vactu == " ") {
      Fluttertoast.showToast(
          msg: "Seleciona una pregunta", toastLength: Toast.LENGTH_SHORT);
    } else if (_valContra != false) {
          Fluttertoast.showToast(
          msg: "Contraseña no cumple los requisitos", toastLength: Toast.LENGTH_SHORT);
    } else if (_valUser != false) {
      Fluttertoast.showToast(
          msg: "Usuario invalido", toastLength: Toast.LENGTH_SHORT);
    } else if (_valTel != false) {
      Fluttertoast.showToast(
                msg: "Telefono invalido", toastLength: Toast.LENGTH_SHORT);
    } else if (_image == null) {

      FormData formData = FormData.fromMap({
        "nombre": nombrectrl.text,
        "apellidos": apellidosctrl.text,
        "usuario": userctrl.text,
        "email": emailctrl.text,
        "tel": telefonoctrl.text,
        "pass": passctrl.text,
        "pass_valid": repeatpassctrl.text,
        "pregunta": vactu,
        "respuesta": respuestactrl.text,
        'file': 'no'
      });
    } else {
      String filename = _image!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "nombre": nombrectrl.text,
        "apellidos": apellidosctrl.text,
        "usuario": userctrl.text,
        "email": emailctrl.text,
        "tel": telefonoctrl.text,
        "pass": passctrl.text,
        "pass_valid": repeatpassctrl.text,
        "pregunta": vactu,
        "respuesta": respuestactrl.text,
        'file': await MultipartFile.fromFile(_image!.path, filename: filename)
      });

      await dio
          .post('https://phpninjahosting.com/manish/Coonet/Php/register.php',
              data: formData)
          .then((value) {
        if (value.toString() == 'si') {
          login = emailctrl.text;
          Fluttertoast.showToast(
              msg: "se ha creado correctamnete",
              toastLength: Toast.LENGTH_SHORT);
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
        } else if (value.toString() == 'SELECIONA PREGUNTA') {
          Fluttertoast.showToast(
              msg: "Seleciona una pregunta", toastLength: Toast.LENGTH_SHORT);
        } else {
          print(value.toString());
        }
      });
    }
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
              height: 10,
            ),
            _preguntaTextField(),
            const SizedBox(
              height: 10,
            ),
            _respuestaTextField(),
            const SizedBox(
              height: 25.0,
            ),
            _SubirImagen(),
            const SizedBox(
              height: 30.0,
            ),
            terminos(),
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
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              errorText: _vacioNombre ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (nombrectrl.text.isEmpty || nombrectrl.text == " ") ? _vacioNombre = true : _vacioNombre = false;
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
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              errorText: _vacioApellido ? 'No se puede dejar vacio' : null,
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
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              errorText: _vacioUser ? 'No se puede dejar vacio' : _valUser ? 'Usuario invalido' : null,
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
          onChanged: (value) {
            setState(() {
              userctrl.text.isEmpty ? _vacioUser = true : _vacioUser = false;
              !user.hasMatch(userctrl.text) ? _valUser = true : _valUser = false;
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
              errorText: _vacioTelefono ? 'No se puede dejar vacio' : _valTel ? 'Telefono invalido' : null,
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
          onChanged: (value) {
            setState(() {
              telefonoctrl.text.isEmpty ? _vacioTelefono = true : _vacioTelefono = false;
              !tel.hasMatch(telefonoctrl.text) ? _valTel = true : _valTel = false;
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
              errorText: _vacioEmail ? 'No se puede dejar vacio' : _valEmail  ? 'Correo Invalido' : null,
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
          onChanged: (value) {
            setState(() {
              emailctrl.text.isEmpty ? _vacioEmail = true : _vacioEmail = false;
              !(EmailValidator.validate(emailctrl.text)) ? _valEmail = true : _valEmail = false;
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
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              errorText: _vacioContra ? 'No se puede dejar vacio' : _valContra ? 'Min. 8 caracteres(1 Mayus, 1 Minus & 1 Num)' : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Caracteres (Min. 8 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              passctrl.text.isEmpty ? _vacioContra = true : _vacioContra = false;
              !regex.hasMatch(passctrl.text) ? _valContra = true : _valContra = false;
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
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              errorText: _vacioRepetir ? 'No se puede dejar vacio' : _valRepetir ? 'No coincide con la contraseña' : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Caracteres (Min. 8 - Max. 18)',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Repetir Contraseña',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              repeatpassctrl.text.isEmpty ? _vacioRepetir = true : _vacioRepetir = false;
              !(passctrl.text == repeatpassctrl.text) ? _valRepetir = true : _valRepetir = false;
            });
          },
        ),
      );
    });
  }

  Widget _preguntaTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            icon: Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          isExpanded: true,
          hint: Text(texto),
          dropdownColor: Color.fromARGB(255, 44, 44, 44),
          value: vactu,
          items: const [
            DropdownMenuItem(
              child: Text(
                'Seleccionar Pregunta',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: " ",
            ),
            DropdownMenuItem(
              child: Text(
                '¿Color favorito?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "color",
            ),
            DropdownMenuItem(
              child: Text(
                '¿El nombre de tu mascota?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "mascota",
            ),
            DropdownMenuItem(
              child: Text(
                '¿Donde nacieron tus padres?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "padres",
            ),
            DropdownMenuItem(
              child: Text(
                '¿Cual es tu mote de pequeño?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "mote",
            ),
            DropdownMenuItem(
              child: Text(
                '¿En que ciudad naciste?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "ciudad",
            ),
            DropdownMenuItem(
              child: Text(
                '¿Como se llama tu colegio de primaria?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "cole",
            ),
          ],
          onChanged: (valor) {
            setState(() {
              texto = valor!;
              vactu = valor;
            });
          }),
    );
  }

  Widget _respuestaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: respuestactrl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              errorText: _vacioRespuesta ? 'No se puede dejar vacio' : null,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              icon: Icon(
                Icons.question_answer_outlined,
                color: Colors.white,
              ),
              hintText: 'Escribir respuesta',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              labelText: 'Respuesta',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              respuestactrl.text.isEmpty
                  ? _vacioRespuesta = true
                  : _vacioRespuesta = false;
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
                'Registrarse',
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
          onPressed: () => agree
              ? _Subir()
              : Fluttertoast.showToast(
                  msg: "No se han aceptado los terminos!",
                  toastLength: Toast.LENGTH_SHORT));
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
              '¿Ya tienes cuenta? ',
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

  Widget terminos() {
    return Row(
      children: [
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
            )),
        servicios()
      ],
    );
  }

  Widget servicios() {
    return InkWell(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: const [
            Text(
              'He leido y acepto los terminos y condiciones de la ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Politica de Privacidad y Servicios',
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 55, 212),
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Politicas())),
    );
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

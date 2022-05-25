import 'dart:convert';

import 'package:coonet/pages/PaginaHome.dart';
import 'package:coonet/pages/PaginaRegistro.dart';
import 'package:coonet/pages/PreguntaSeguridad.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'Users/FreeLancer.dart';
import 'CorreoRecuperacion.dart';
import 'Menu.dart';
import 'RecuperarContra.dart';
import 'data_utils.dart';

class PaginaLogin extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<PaginaLogin> {
  late TextEditingController emailctrl = TextEditingController(),
      passctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text('LOG IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white)),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Flexible(
              child: Image.asset(
                './images/logo.png',
                height: 100.0,
              ),
            ),
            const SizedBox(
              height: 45.0,
            ),
            _userTextField(),
            const SizedBox(
              height: 15.0,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 15.0,
            ),
            _recuperarContra(),
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
            const SizedBox(
              height: 90.0,
            ),
            _registrarseAhora(),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    final user = StreamChat.of(context).client;
    var client = http.Client();
    var data = {"email": emailctrl.text, "pass": passctrl.text};
    var url =
        Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/login.php');
    var Response = await client.post(url, body: data);

    if (jsonDecode(Response.body) == "no") {
      Fluttertoast.showToast(
          msg: "El usuario y la contraseña no coinciden.",
          toastLength: Toast.LENGTH_SHORT);
    } else if (Response.statusCode == 200) {
      login = emailctrl.text;
      String username = jsonDecode(Response.body);
      Fluttertoast.showToast(
          msg: "Se ha iniciado sesion correctamente",
          toastLength: Toast.LENGTH_SHORT);
      user.connectUser(
          User(
              id: username,
              extraData: {'imag': DataUtils.getUserImage(username)}),
          user.devToken(username).rawValue);
      //Ir a otra pagina

      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu()));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Ha habido un error al hacer el login",
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  Widget _userTextField() {
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
              labelText: 'Correo electronico',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintStyle: TextStyle(
                color: Colors.white54,
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
              hintText: 'Caracteres (Min. 8 - Max. 18)',
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

  Widget _recuperarContra() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return InkWell(
        child: Row(
          children: const [
            Spacer(),
            Text(
              '¿Has olvidad la contraseña? ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Recuperar',
              style: TextStyle(color: Color.fromARGB(255, 112, 217, 255)),
            ),
            Spacer(),
          ],
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => CorrreoRecuperacion())),
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
                'Iniciar Sesion',
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
          onPressed: () => loginUser());
    });
  }

  Widget _registrarseAhora() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return InkWell(
        child: Row(
          children: const [
            Spacer(),
            Text(
              '¿No tienes cuenta? ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Registrate aquí!',
              style: TextStyle(color: Color.fromARGB(255, 175, 82, 206)),
            ),
            Spacer(),
          ],
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => PaginaRegistro())),
      );
    });
  }
}

import 'package:coonet/pages/EditarPerfil.dart';
import 'package:coonet/pages/PaginaNuevaOferta.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'Pagos.dart';
import 'Menu.dart';
import 'MisProyectos.dart';
import 'PaginaLogin.dart';
import 'Users/FreeLancer.dart';
import 'Valorar.dart';

void main() => runApp(PaginaUsr(free: fetchPost()));

class PaginaUsr extends StatefulWidget {
  final Future<FreeLan> free;
  const PaginaUsr({Key? key, required this.free}) : super(key: key);

  @override
  State<PaginaUsr> createState() => _PaginaUsrState();
}

class _PaginaUsrState extends State<PaginaUsr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<FreeLan>(
          future: widget.free,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/fondo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: const Text('PERFIL',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          )),
                    ),
                    _Perfil(snapshot),
                    Align(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          _buttonMisProyectos(),
                          const SizedBox(
                            height: 20,
                          ),
                          _buttonValorar(),
                          const SizedBox(
                            height: 20,
                          ),
                          _buttonPagos(),
                          const SizedBox(
                            height: 20,
                          ),
                          _buttonNuevaOferta(),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              _botonOut(),
                              Spacer(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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

  Widget _Perfil(AsyncSnapshot<FreeLan> snapshot) {
    String plus = "";
    id_perfil = snapshot.data!.id;
    nombre = snapshot.data!.nombre;
    apellido = snapshot.data!.apellido;
    user = snapshot.data!.user;
    telefono = snapshot.data!.telefono;
    correo = snapshot.data!.correo;
    foto = snapshot.data!.foto;
    premium = snapshot.data!.premium;
    if (snapshot.data!.premium == "0") {
      plus = "No adquirido";
    } else {
      plus = "Adquirido";
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 80.0,
                    child: ClipOval(
                      child: Image.network(
                        snapshot.data!.foto,
                        fit: BoxFit.cover,
                        width: 80.0,
                        height: 80.0,
                      ),
                    ),
                  ),
                ),
              ),
              _editar()
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 200.0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            snapshot.data!.nombre +
                                " " +
                                snapshot.data!.apellido,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 243, 243, 1),
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.alternate_email_rounded,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            snapshot.data!.user,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 243, 243, 1),
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            snapshot.data!.correo,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 243, 243, 1),
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            snapshot.data!.telefono,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 243, 243, 1),
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            plus,
                            style: const TextStyle(
                              color: Color.fromRGBO(245, 243, 243, 1),
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonMisProyectos() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 300,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'MIS PROYECTOS',
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MisProyectos()));
          });
    });
  }

  Widget _editar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 90,
              alignment: Alignment.center,
              child: const Text(
                'EDITAR',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 255, 255),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditarPerfil(free: fetchPost())));
          });
    });
  }

  Widget _buttonValorar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 300,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'VALORAR',
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ValoWidget()));
          });
    });
  }

  Widget _buttonPagos() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
          child: Container(
              width: 300,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: const Text(
                'PAGOS',
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PagoWidget()));
          });
    });
  }

  Widget _buttonNuevaOferta() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
            alignment: Alignment.center,
            child: const Text(
              'CREAR OFERTA',
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
          paginaActual = 2;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
        },
      );
    });
  }

  Widget _botonOut() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 30.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(width: 5,),
              Text("Cerrar Sesion")
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 255, 0, 0),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            final client = StreamChat.of(context).client;
            client.disconnectUser();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaginaLogin()));
          },
        );
      },
    );
  }
}

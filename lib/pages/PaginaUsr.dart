import 'package:flutter/material.dart';
import '../Pagos.dart';
import 'MisProyectos.dart';
import 'Users/FreeLancer.dart';

void main() => runApp(PaginaUsr(free: fetchPost()));

class PaginaUsr extends StatelessWidget {
  final Future<FreeLan> free;
  const PaginaUsr({Key? key, required this.free}) : super(key: key);

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
        child: ListView(children: [
          _Perfil(),
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
                _buttonNuevaOferta()
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _Perfil() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 80.0,
                    child: ClipOval(
                      child: FutureBuilder<FreeLan>(
                        future: free,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network(
                              snapshot.data!.foto,
                              fit: BoxFit.cover,
                              width: 100.0,
                              height: 100.0,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  child: Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 245, 245, 244),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {}),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 190.0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: FutureBuilder<FreeLan>(
                        future: free,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "Nombre: " +
                                  snapshot.data!.nombre +
                                  " " +
                                  snapshot.data!.apellido,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 243, 243, 1),
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.justify,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: FutureBuilder<FreeLan>(
                        future: free,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "Usuario: " + snapshot.data!.user,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 243, 243, 1),
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.justify,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: FutureBuilder<FreeLan>(
                        future: free,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "Email: " + snapshot.data!.correo,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 243, 243, 1),
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.justify,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // Por defecto, muestra un loading spinner
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: FutureBuilder<FreeLan>(
                        future: free,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "Tel: " + snapshot.data!.telefono,
                              style: const TextStyle(
                                color: Color.fromRGBO(245, 243, 243, 1),
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.justify,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // Por defecto, muestra un loading spinner
                          return const CircularProgressIndicator();
                        },
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
          onPressed: () {});
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
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
          onPressed: () {});
    });
  }
}

import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:coonet/pages/Users/Valoracion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Users/InfoAnuncio.dart';

//https://programmerclick.com/article/30011048702/

class TextoValorados extends StatefulWidget {
  final Future<Valoracion> valoracion;

  TextoValorados({Key? key, required this.valoracion}) : super(key: key);
  @override
  Servicios createState() => Servicios(valoracion);
}

class Servicios extends State<TextoValorados> {
  late PageController pageViewController = PageController();
  late String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Future<Valoracion> valoracion;
  Servicios(this.valoracion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: FutureBuilder<Valoracion>(
          future: valoracion,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  appbartt(snapshot.data!.titulo.toString()),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional(0, -1),
                          children: [
                            Container(
                              height: 540,
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: 530,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
                                      child: PageView(
                                        controller: pageViewController,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Image.network(
                                            snapshot.data!.foto1.toString(),
                                            width: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                5.3,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            snapshot.data!.foto2.toString(),
                                            width: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                5.3,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            snapshot.data!.foto3.toString(),
                                            width: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                5.3,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            snapshot.data!.foto4.toString(),
                                            width: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                5.3,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.85),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 470, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x430F1113),
                                        offset: Offset(0, -2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(0, 1),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0, -0.15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 16, 20, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 16.0,
                                                        child: ClipOval(
                                                          child: Image.network(
                                                            snapshot
                                                                .data!.fotoUser
                                                                .toString(),
                                                            fit: BoxFit.cover,
                                                            width: 40.0,
                                                            height: 40.0,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        snapshot.data!.nombre
                                                            .toString(),
                                                        style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 25.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            snapshot.data!.titulo.toString(),
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Container(
                    width: 360,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 6, 12, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'PUNTUACIÓN MEDIA\n',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 65.0, bottom: 20.0),
                                child: Flexible(
                                  child: RatingBarIndicator(
                                    rating: double.parse(
                                        snapshot.data!.estrellas.toString()),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 25.0,
                                    direction: Axis.horizontal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          valoresult(snapshot),
                          const Divider(
                            height: 24,
                            thickness: 2,
                            color: Color(0xFFF1F4F8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(
                                                  255, 147, 34, 200)),
                                    ),
                                    child: Text('CERRAR'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x25090F13),
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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

  Widget appbartt(String string) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 138, 3, 228),
      title: Text(string),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget valoresult(AsyncSnapshot<Valoracion> snapshot) {
    return Container(
      child: Text(snapshot.data!.comentario.toString()),
    );
  }
}

import 'dart:convert';

import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Comentario.dart';
import 'PaginaChatPersonal.dart';
import 'ServicioWidget.dart';
import 'Users/InfoAnuncio.dart';

class PendienteValorar extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PendienteValorar> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Anuncios> data = <Anuncios>[];

  Future<List<Anuncios>> get_anuncios() async {
    var data = {"email": login};
    var url = Uri.parse(
        'https://phpninjahosting.com/manish/Coonet/Php/Valoracion_P.php');
    final response = await http.post(url, body: data);
    var datos = jsonDecode(response.body);
    var registros = <Anuncios>[];
    if (response.statusCode == 200) {
      if (datos == 'no') {
        Fluttertoast.showToast(
            msg: "No hay ofertas para valorar",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        for (datos in datos) {
          registros.add(Anuncios.fromJson(datos));
        }
      }
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }

    return registros;
  }

  @override
  void initState() {
    super.initState();
    get_anuncios().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
    searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 241, 244, 248),
        body: Container(
            child: Column(
          children: [
            Expanded(
              child: _Anuncio(),
            ),
          ],
        )));
  }

  Widget _Anuncio() {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: Image.network(
                                  data[index].foto1,
                                ).image,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 120, 0, 0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(207, 18, 18, 18),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data[index].titulo.toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              data[index].nombre,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                String id =
                                                    data[index].id_anuncio;
                                                String? id_comprar =
                                                    data[index].id_compra;
                                                fetchINFO(id);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComentarioValo(
                                                            id_comprar,
                                                            free:
                                                                fetchINFO(id)),
                                                  ),
                                                );
                                              },
                                              child: const Text('Valorar',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

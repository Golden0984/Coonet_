import 'dart:convert';

import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:coonet/pages/Users/Valoracion.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'PaginaChatPersonal.dart';
import 'ServicioWidget.dart';
import 'TextoValorados.dart';
import 'Users/InfoAnuncio.dart';

class Valorados extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<Valorados> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Anuncios> data = <Anuncios>[];

  Future<List<Anuncios>> get_anuncios() async {
    var data = {"email": login};
    var url = Uri.parse(
        'https://phpninjahosting.com/manish/Coonet/Php/Valoracion_H.php');
    final response = await http.post(url, body: data);
    var datos = jsonDecode(response.body);
    var registros = <Anuncios>[];
    if (response.statusCode == 200) {
      if (datos == 'no') {
        Fluttertoast.showToast(
            msg: "No hay ofertas valoradas", toastLength: Toast.LENGTH_SHORT);
      } else {
        for (datos in datos) {
          registros.add(Anuncios.fromJson(datos));
        }
      }
    } else {
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
                                              data[index].titulo,
                                            ),
                                            Text(
                                              data[index].nombre,
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
                                              String id_comprar = data[index]
                                                  .id_compra
                                                  .toString();
                                              fetchValoracion(id_comprar!);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TextoValorados(
                                                              valoracion:
                                                                  fetchValoracion(
                                                                      id_comprar))));
                                            },
                                            child: const Text('Ver'),
                                          ),
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

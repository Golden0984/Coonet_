import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PreviewServicio.dart';
import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'PaginaChatPersonal.dart';
import 'ServicioWidget.dart';
import 'Users/FreeLancer.dart';
import 'Users/InfoAnuncio.dart';

class MisProyectos extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<MisProyectos> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Anuncios> data = <Anuncios>[];

  Future<List<Anuncios>> get_anuncios() async {
    var data = {"email": login};
    var url = Uri.parse(
        'https://phpninjahosting.com/manish/Coonet/Php/Misproyectos.php');
    final response = await http.post(url, body: data);
    var datos = jsonDecode(response.body);
    var registros = <Anuncios>[];
    if (response.statusCode == 200) {
      if (datos == 'no') {
        Fluttertoast.showToast(
            msg: "No hay anuncios creados", toastLength: Toast.LENGTH_SHORT);
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
    /*if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }*/
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          paginaActual = 4;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "MIS PROYECTOS",
                        style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
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
                            height: 220,
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
                                  0, 110, 0, 0),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const Divider(
                                              indent: 0,
                                              endIndent: 90,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 15.0,
                                                  child: ClipOval(
                                                    child: Image.network(
                                                      data[index].foto_user,
                                                      fit: BoxFit.cover,
                                                      width: 30.0,
                                                      height: 30.0,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text(
                                                  data[index].nombre,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
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
                                              fetchINFO(id);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PreviewServicio(
                                                              free: fetchINFO(
                                                                  id))));
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  'VER',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                )),
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'ServicioWidget.dart';
import 'Users/Anuncios.dart';
import 'Users/InfoAnuncio.dart';

class PaginaHome extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Anuncios> data = <Anuncios>[];
  bool visible = false;
  Future<List<Anuncios>> get_All_anuncio() async {
    var url =
        Uri.parse("https://phpninjahosting.com/manish/Coonet/Php/Anuncio.php");
    final response = await http.post(url);
    var datos = jsonDecode(response.body);
    var registros = <Anuncios>[];
    for (datos in datos) {
      registros.add(Anuncios.fromJson(datos));
    }

    return registros;
  }

  Future<List<Anuncios>> get_anuncio_cat(String categoria) async {
    var data = {"categoria": categoria};
    var url = Uri.parse(
        "https://phpninjahosting.com/manish/Coonet/Php/AnuncioCat.php");
    final response = await http.post(url, body: data);
    var datos = jsonDecode(response.body);
    var registros = <Anuncios>[];
    if (jsonDecode(response.body) == "no") {
      if (visible == false) {
        Fluttertoast.showToast(
            msg: "No hay ninguna ofeta con esta categoria",
            toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      for (datos in datos) {
        registros.add(Anuncios.fromJson(datos));
      }
    }

    return registros;
  }

  @override
  void initState() {
    get_All_anuncio().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
    searchFieldController = TextEditingController();
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
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Text('INICIO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /*Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: 350,
                        height: 40,
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 4, 20, 0),
                              child: TextFormField(
                                controller: searchFieldController,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Buscar la categoria aqui...',
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: Color.fromARGB(255, 59, 57, 57),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'CATEGOR??AS',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 18,
                  endIndent: 285,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 1, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 1, 0, 1),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.all_inclusive,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 30,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Todos',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = true;
                              data = <Anuncios>[];
                              get_anuncio_cat("programacion").then((value) {
                                get_All_anuncio().then((value) {
                                  setState(() {
                                    data.addAll(value);
                                  });
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 8, 0, 8),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.app_settings_alt,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Creaci??n apps',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = false;
                              data = <Anuncios>[];
                              get_anuncio_cat("app").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 8, 0, 8),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.web,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Programaci??n',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              data = <Anuncios>[];
                              get_anuncio_cat("programacion").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.design_services,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Dise??o web',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = false;
                              data = <Anuncios>[];
                              get_anuncio_cat("disenoweb").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.video_settings,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Edici??n video',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = false;
                              data = <Anuncios>[];
                              get_anuncio_cat("videoEditig").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: const Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.photo,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Edici??n Fotos',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = false;
                              data = <Anuncios>[];
                              get_anuncio_cat("editfotos").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 0, 12, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF1F4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.video_call,
                                        color:
                                            Color.fromARGB(255, 140, 48, 183),
                                        size: 32,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Video Maker',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              visible = false;
                              data = <Anuncios>[];
                              get_anuncio_cat("produvideo").then((value) {
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        'TODAS LAS OFERTAS',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 18,
                  endIndent: 230,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ],
            ),
            Flexible(
              child: _Anuncio(),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 16, 30, 0),
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
                              ),
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
                                color: Color.fromARGB(207, 0, 0, 0),
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const Divider(
                                            indent: 0,
                                            endIndent: 90,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          Row(children: [
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
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              data[index].nombre,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ]),
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
                                                      ServicioWidget(
                                                    free: fetchINFO(id),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                const Text(
                                                  'INFO',
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
                                              ),
                                            )),
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
      },
    );
  }
}

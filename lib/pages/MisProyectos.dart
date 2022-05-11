import 'dart:convert';

import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PaginaChatPersonal.dart';
import 'ServicioWidget.dart';

class MisProyectos extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<MisProyectos> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
List<Anuncios> data  = <Anuncios>[];

Future<List<Anuncios>> get_anuncios() async {

  var url =
      Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/Anuncio.php');
  final response = await http.post(url);
  var datos = jsonDecode(response.body);
  var registros = <Anuncios>[];
  for(datos in datos){
    registros.add(Anuncios.fromJson(datos));
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
    get_anuncios().then((value){
      setState(() {
        data.addAll(value);
      });
    });
    searchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    bool _boolea = false;
    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 241, 244, 248),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fondo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 60.0,
            ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 35,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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

            Expanded (child: _Anuncio(),),
          ],)
            
        ));
  }

  Widget _Anuncio() {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
          return Container( 
            child: Column(
            children: 
          [Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Color(0x80FFFFFF),
                              borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => const ServicioWidget()));},
                                        child: const Text('Reserve'),
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
        ],),
      );
      }
      );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ServicioWidget.dart';
import 'Users/Anuncios.dart';

class PaginaHome extends StatefulWidget {

  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 241, 244, 248),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        
        child: 
        Column(children: 
          [
            const SizedBox(
              height: 70.0,
            ),
            Column(
              
            mainAxisSize: MainAxisSize.max,
            children: [
              
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(250, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                        child: TextFormField(
                          controller: searchFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Buscar la categoria aqui...',
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: const Color(0xFF95A1AC),
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'CATEGORÍAS',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 1, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
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
                                    color: Color(0xFF95A1AC),
                                    size: 32,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Text(
                                    'Apps',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
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
                                    color: const Color(0xFF95A1AC),
                                    size: 32,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: const Text(
                                    'Web',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
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
                                    color: const Color(0xFF95A1AC),
                                    size: 32,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Text(
                                    'Logo Design',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
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
                                    color: const Color(0xFF95A1AC),
                                    size: 32,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Text(
                                    'Video Editing',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
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
                                    Icons.directions_run_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 32,
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                  child: Text(
                                    'Running',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                      style: TextStyle( fontFamily: 'Jura'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        Expanded (child: _Anuncio(),),
        ],
          
        )
      ),);
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
                      padding: const EdgeInsetsDirectional.fromSTEB(30, 16, 30, 0),
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
                                        child: const Text('CONTACTAR'),
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
import 'package:flutter/material.dart';

import 'PaginaChatPersonal.dart';
import 'ServicioWidget.dart';

class MisProyectos extends StatefulWidget {
  @override
  _PaginaHomeState createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<MisProyectos> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: ListView(
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
                                fit: BoxFit.fitHeight,
                                image: Image.network(
                                  'https://www.devsdna.com/wp-content/uploads/2021/01/Graphic_Designer1920x1080.jpg',
                                ).image,
                              ),
                              boxShadow: [
                                const BoxShadow(
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
                                  color: const Color(0x80FFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: const Radius.circular(8),
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
                                            const Text(
                                              'Logo Maker',
                                            ),
                                            const Text(
                                              'Cris Smith',
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
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ServicioWidget()));
                                            },
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.network(
                                  'https://www.simplybusiness.co.uk/static/88706991538cf5915633e9f598eb7721/fd9f6/how-to-become-a-freelance-graphic-designer.jpg',
                                ).image,
                              ),
                              boxShadow: [
                                const BoxShadow(
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
                                  color: const Color(0x80FFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: const Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: const Radius.circular(0),
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
                                            const Text(
                                              'Low Cost Logos',
                                            ),
                                            const Text(
                                              'Jaden Cooper',
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
                                              print(
                                                  'Button-Reserve pressed ...');
                                            },
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.network(
                                  'https://www.mbt2you.com/wp-content/uploads/2021/12/how-to-make-money-as-a-graphic-designer.jpg',
                                ).image,
                              ),
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 3,
                                  color: const Color(0x33000000),
                                  offset: const Offset(0, 2),
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
                                  color: const Color(0x80FFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: const Radius.circular(0),
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
                                            const Text(
                                              'Minimalist Logos',
                                            ),
                                            const Text(
                                              'Caitlyn Wager',
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
                                              print(
                                                  'Button-Reserve pressed ...');
                                            },
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.network(
                                  'https://www.mbt2you.com/wp-content/uploads/2021/12/how-to-make-money-as-a-graphic-designer.jpg',
                                ).image,
                              ),
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 3,
                                  color: const Color(0x33000000),
                                  offset: const Offset(0, 2),
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
                                  color: const Color(0x80FFFFFF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                    topLeft: Radius.circular(0),
                                    topRight: const Radius.circular(0),
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
                                            const Text(
                                              'Minimalist Logos',
                                            ),
                                            const Text(
                                              'Caitlyn Wager',
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
                                              print(
                                                  'Button-Reserve pressed ...');
                                            },
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
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

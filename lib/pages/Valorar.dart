import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/imagen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'MisProyectos.dart';
import 'PendientesValorar.dart';
import 'ServicioWidget.dart';
import 'Users/Anuncios.dart';
import 'Users/FreeLancer.dart';
import 'Users/InfoAnuncio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ServicioWidget.dart';
import 'Users/Anuncios.dart';
import 'Users/InfoAnuncio.dart';
import 'Valorados.dart';

class ValoWidget extends StatefulWidget {
  @override
  _PagoWidgetState createState() => _PagoWidgetState();
}

//https://www.youtube.com/watch?v=RKAjUlQgR6A
//https://www.youtube.com/watch?v=8x2Ssf5OxQ4

class _PagoWidgetState extends State<ValoWidget> {
  late TextEditingController searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _paginas = [
    ValoWidget(),
    ValoWidget(),
  ];
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
            )
          )
        )
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 138, 3, 228),
            elevation: 0,
            bottom: const TabBar(
              
              tabs: [
                Tab(icon: Text("Pendientes de Valorar")),
                Tab(icon: Text("Valorados")),
              ],
            ),
            title: Text("VALORAR"),
            leading: IconButton(
              onPressed: () {
                paginaActual = 4;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: TabBarView(
              children: [
                PendienteValorar(),
                Valorados(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}

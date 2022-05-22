import 'dart:convert';

import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/Users/pagos.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Users/FreeLancer.dart';

class PagoWidget extends StatefulWidget {
  @override
  _PagoWidgetState createState() => _PagoWidgetState();
}

class _PagoWidgetState extends State<PagoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Pagos> data = <Pagos>[];
  Future<List<Pagos>> get_anuncios() async {
    var data = {"email": login};
    var url =
        Uri.parse('https://phpninjahosting.com/manish/Coonet/Php/pagos.php');
    final response = await http.post(url, body: data);
    var datos = jsonDecode(response.body);
    var registros = <Pagos>[];
    if (response.statusCode == 200) {
      if (datos == 'no') {
        Fluttertoast.showToast(
            msg: "No hay anuncios creados", toastLength: Toast.LENGTH_SHORT);
      } else {
        for (datos in datos) {
          registros.add(Pagos.fromJson(datos));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 62.0),
            Container(
              child: Row(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Menu()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      "PAGOS",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _Pagos(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Pagos() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x3B000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 263,
                            child: Text(
                              data[index].titulo.toUpperCase(),
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            child: Text(
                              data[index].fecha.toUpperCase(),
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  const Divider(
                      indent: 0,
                      endIndent: 0,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  Row(
                    children: [
                      Text(
                        'PLAN: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data[index].plan,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ESTADO: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "PAGADO",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 8),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: Text(
                                  '\-' + data[index].precio + '€',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

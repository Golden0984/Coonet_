import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Users/InfoAnuncio.dart';

class ServicioWidget extends StatefulWidget {
  final Future<InfoAnuncio> free;
  const ServicioWidget({Key? key, required this.free}) : super(key: key);
  @override
  Servicios createState() => Servicios(free);
}

class Servicios extends State<ServicioWidget> {
  late PageController pageViewController = PageController();
  late String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Future<InfoAnuncio> free;
  Servicios(this.free);

  Dio dio = new Dio();

  Future<void> _Comprar(String id) async {
    FormData formData = FormData.fromMap({
      "correo": login,
      "id_Anuncio": id,
    });

    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/Comprar.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'hecho') {
        Fluttertoast.showToast(
            msg: "Compra Completada", toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina

      } else if (value.toString() == 'Error') {
        Fluttertoast.showToast(
            msg: "Error al realizar la compra",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: FutureBuilder<InfoAnuncio>(
          future: free,
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
                                                                .data!.foto_user
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
                                                      SizedBox(
                                                        child: Text(
                                                          snapshot.data!.nombre
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontSize: 25.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        width: 180,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0.0),
                                                child: Flexible(
                                                  child: RatingBarIndicator(
                                                    rating: double.parse(
                                                        snapshot
                                                            .data!.valoracion_G
                                                            .toString()),
                                                    itemBuilder:
                                                        (context, index) =>
                                                            const Icon(
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
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
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
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'DESCRIPCIÓN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            snapshot.data!.descripcion.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'PLANES',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 360,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 104, 61, 134)),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x25090F13),
                          offset: Offset(10, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLAN ECONÓMICO\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.descripcion_E.toString(),
                            style: TextStyle(fontSize: 13),
                          ),
                          Divider(
                            height: 24,
                            thickness: 2,
                            color: Color(0xFFF1F4F8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.precio_E.toString() + "€",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            snapshot.data!.id.toString());
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )),
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
                      border:
                          Border.all(color: Color.fromARGB(255, 104, 61, 134)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x25090F13),
                          offset: Offset(10, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLAN STANDAR\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.descripcion_S.toString(),
                            style: TextStyle(fontSize: 13),
                          ),
                          Divider(
                            height: 24,
                            thickness: 2,
                            color: Color(0xFFF1F4F8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.precio_S.toString() + "€",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            snapshot.data!.id.toString());
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )),
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
                      border:
                          Border.all(color: Color.fromARGB(255, 104, 61, 134)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x25090F13),
                          offset: Offset(10, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PLAN PREMIUM\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data!.descripcion_P.toString(),
                            style: TextStyle(fontSize: 13),
                          ),
                          Divider(
                            height: 24,
                            thickness: 2,
                            color: Color(0xFFF1F4F8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.precio_P.toString() + "€",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            snapshot.data!.id.toString());
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                          child: Text(
                            "VALORACIÓN GENERAL",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _valoraciones()
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

  void showDialog(String string) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("¿Desea adquirir el paquete?"),
          actions: [
            CupertinoDialogAction(
              child: Text("SI"),
              onPressed: () {
                _Comprar(string);
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  Widget _valoraciones() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
      child: Container(
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
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'COONET PAGINA WEB RESPONSIVE',
                    ),
                  ],
                ),
              ),
              Text(
                '\300€',
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ESTADO: PAGADO.',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                          child: Text(
                            'Total',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Text(
                          '\300€',
                          textAlign: TextAlign.end,
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
    );
  }

  Widget appbartt(String string) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 147, 34, 200),
      title: Text(string),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}

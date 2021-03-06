import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Users/InfoAnuncio.dart';
import 'Valorar.dart';

//https://programmerclick.com/article/30011048702/

class ComentarioValo extends StatefulWidget {
  final Future<InfoAnuncio> free;
  String? id_comprar;
  ComentarioValo(this.id_comprar, {Key? key, required this.free})
      : super(key: key);
  @override
  Servicios createState() => Servicios(free, id_comprar);
}

class Servicios extends State<ComentarioValo> {
  late PageController pageViewController = PageController();
  late TextEditingController comentarioctrl = TextEditingController();
  late String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Future<InfoAnuncio> free;
  String? id_comprar;
  Servicios(this.free, this.id_comprar);

  double valoracion = 0.0;

  Dio dio = new Dio();

  Future<void> _Comentar() async {
    if (comentarioctrl.text.trim().isEmpty || valoracion == 0.0) {
      Fluttertoast.showToast(
          msg: "Hay campos vacios.", toastLength: Toast.LENGTH_SHORT);
    } else {
      FormData formData = FormData.fromMap({
        "id_comprar": id_comprar,
        "email_user": login,
        "id_anuncio": id_anuncio,
        "valoracion": valoracion.toString(),
        "comentario": comentarioctrl.text,
      });
      await dio
          .post('https://phpninjahosting.com/manish/Coonet/Php/Comentarios.php',
              data: formData)
          .then((value) {
        if (value.toString() == 'hecho') {
          Fluttertoast.showToast(
              msg: "Comentario realizado corectamente",
              toastLength: Toast.LENGTH_SHORT);
          //Ir a otra pagina
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ValoWidget()));
        } else if (value.toString() == 'Error') {
          Fluttertoast.showToast(
              msg: "Ha habido un error al publicar el comentario",
              toastLength: Toast.LENGTH_SHORT);
        } else {
          print(value.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                                                      Text(
                                                        snapshot.data!.nombre
                                                            .toString(),
                                                        style: const TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 25.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Container(
                    width: 360,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 6, 12, 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'DEJA TU COMENTARIO\n',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 65.0, bottom: 20.0),
                                child: Flexible(
                                  child: RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 25,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      valoracion = rating;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          textheg(),
                          const Divider(
                            height: 24,
                            thickness: 2,
                            color: Color(0xFFF1F4F8),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        id_anuncio =
                                            snapshot.data!.id.toString();
                                        _Comentar();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('VALORAR'),
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
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x25090F13),
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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

  Widget appbartt(String string) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 138, 3, 228),
      title: Text(string),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget textheg() {
    final maxLines = 5;
    return Container(
      margin: EdgeInsets.all(0),
      height: maxLines * 24.0,
      child: TextField(
        controller: comentarioctrl,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }
}

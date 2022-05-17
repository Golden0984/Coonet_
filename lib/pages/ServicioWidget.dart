import 'package:coonet/pages/Users/Anuncios.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                                                            "https://images.unsplash.com/photo-1608889825205-eebdb9fc5806?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                                                            fit: BoxFit.cover,
                                                            width: 40.0,
                                                            height: 40.0,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Text(
                                                        snapshot.data!.nombre
                                                            .toString(),
                                                        style: const TextStyle(
                                                          overflow: TextOverflow.ellipsis,
                                                          fontSize: 25.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 170.0),
                                                child: Flexible(
                                                  child: RatingBarIndicator(
                                                    rating: 3,
                                                    itemBuilder: (context, index) => const Icon(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: 19.0,
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
                  Container(
                    width: 360,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 104, 61, 134)),
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
                            'SUSCRIPCIÓN PREMIUM (MENSUAL)\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'El FreeLancer obtendrá una reducción del 15%\nen la comisión de retención.',
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
                                      '9,99€',
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                      child: Column(

                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SUSCRIPCIÓN PREMIUM (MENSUAL)\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'El FreeLancer obtendrá una reducción del 15%\nen la comisión de retención.',
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
                                      '9,99€',
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 16),
                      child: Column(

                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SUSCRIPCIÓN PREMIUM (MENSUAL)\n',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'El FreeLancer obtendrá una reducción del 15%\nen la comisión de retención.',
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
                                      '9,99€',
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 147, 34, 200)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('COMPRAR'),
                                        ],
                                      )
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                          child: Text(
                            "Valoracion General",
                            style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ],
                    ),
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

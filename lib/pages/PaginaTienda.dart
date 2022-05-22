import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaginaTienda extends StatefulWidget {
  const PaginaTienda({Key? key}) : super(key: key);
  @override
  _PaginaTiendaState createState() => _PaginaTiendaState();
}

class _PaginaTiendaState extends State<PaginaTienda> {
  late bool premium = false;

  Dio dio = new Dio();

  Future<void> _Comprar(String plan, String titulo, String precio) async {
    FormData formData = FormData.fromMap({
      "correo": login,
      "plan": plan,
      "titulo": titulo,
      "precio": precio,
    });

    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/Tienda.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'hecho') {
        acceptCompra();
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "TIENDA",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Arial', fontSize: 30, color: Colors.white),
            ),
          ),
          Column(
            children: [
              menusalPack(),
              trimestralPack(),
              anualPack(),
            ],
          ),
        ]),
      ),
    );
  }

  Widget menusalPack() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x25090F13),
              offset: Offset(0, 2),
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
                          '9,99€/mes',
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
                          onPressed: () {
                            showDialog('SUSCRIPCIÓN PREMIUM',
                                'SUSCRIPCIÓN PREMIUM (MENSUAL)', '9,99');
                          },
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
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget trimestralPack() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x25090F13),
              offset: Offset(0, 2),
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
                'SUSCRIPCIÓN PREMIUM (TRIMESTRAL)\n',
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
                          '25,99€/mes',
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
                          onPressed: () {
                            showDialog('SUSCRIPCIÓN PREMIUM',
                                'SUSCRIPCIÓN PREMIUM (TRIMESTRAL)', '25,99');
                          },
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
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget anualPack() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x25090F13),
              offset: Offset(0, 2),
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
                'SUSCRIPCIÓN PREMIUM (ANUAL)\n',
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
                          '64,99€/Anual',
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
                          onPressed: () {
                            showDialog('SUSCRIPCIÓN PREMIUM',
                                'SUSCRIPCIÓN PREMIUM (ANUAL)', '64,99');
                          },
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
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialog(String titulo, String plan, String precio) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("¿Desea adquirir el paquete?"),
          actions: [
            CupertinoDialogAction(
              child: Text("SI"),
              onPressed: () {
                _Comprar(plan, titulo, precio);
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

  void acceptCompra() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Se ha adquirido el paquete exitosamente!"),
          content: Text("!Gracias por su compra!"),
          actions: [
            CupertinoDialogAction(
              child: Text("ACEPTAR"),
              onPressed: () {
                paginaActual = 0;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
            ),
          ],
        );
      },
    );
  }
}

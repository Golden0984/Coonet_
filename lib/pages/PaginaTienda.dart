import 'dart:ui';

import 'package:flutter/material.dart';

class PaginaTienda extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget> [
            Text('TIENDA', style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView(children: [
                 menusalPack(),
                 trimestralPack(),
                 anualPack(),
              ]),
            ),
          ]
        ),
      ),
    );
  }

  Widget menusalPack(){
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
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize:  25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: (){

                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 147, 34, 200)),),
                    child: Row(
                      children: [
                         Icon(
                            Icons.add_shopping_cart,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          SizedBox(width: 10,),
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

  Widget trimestralPack(){
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
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
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
                      style: TextStyle(fontSize:  25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: (){

                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 147, 34, 200)),),
                    child: Row(
                      children: [
                         Icon(
                            Icons.add_shopping_cart,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          SizedBox(width: 10,),
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

  Widget anualPack(){
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
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
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
                      '89,99€/mes',
                      style: TextStyle(fontSize:  25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: (){

                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 147, 34, 200)),),
                    child: Row(
                      children: [
                         Icon(
                            Icons.add_shopping_cart,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                          SizedBox(width: 10,),
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
}
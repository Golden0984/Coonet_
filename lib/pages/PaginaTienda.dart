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
            AppBar(
            title: Text('TIENDA'),),
            Expanded(
              child: ListView(children: [
                 menusalPack(),
                 menusalPack(),
                 menusalPack(),
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
            'Good Morning,',
          ),
          Text(
            'Below are your daily lessons',
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
                      'Daily Coffees',
                    ),
                    Text(
                      '3',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avg. Rating',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '4.6',
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Icon(
                            Icons.star_rounded,
                            color: Color(0xFF57636C),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
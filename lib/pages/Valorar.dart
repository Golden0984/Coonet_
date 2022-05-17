import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/imagen.dart';
import 'package:flutter/material.dart';

class ValoWidget extends StatefulWidget {
  @override
  _PagoWidgetState createState() => _PagoWidgetState();
}

class _PagoWidgetState extends State<ValoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _paginas = [
    ValoWidget(),
    ValoWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text("Pendientes de Valorar")),
                Tab(icon: Text("Valorados")),
              ],
            ),
            title: Text("VALORAR"),
            leading: IconButton(
              onPressed: () {},
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
               Tab(icon: Text("Pendientes de Valorar")),
               Tab(icon: Text("Valorados")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

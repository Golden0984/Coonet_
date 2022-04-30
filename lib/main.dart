import 'package:coonet/pages/PaginaLogin.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
//para pag valoracion
//https://esflutter.dev/docs/development/ui/layout  <--Empaquetar widgets

class _MyAppState extends State<MyApp> {
  int _paginaActual = 0;

  List<Widget> _paginas = [PaginaLogin()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//quitar la barra de debug
      debugShowCheckedModeBanner: false,
      title: 'Coonet',
      home: Scaffold(
        body: _paginas[_paginaActual],

        //Menu de abajo

        /*bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          onTap: (index){
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: "Users"),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Login"),
          ],
        ),*/
      ),
    );
  }
}

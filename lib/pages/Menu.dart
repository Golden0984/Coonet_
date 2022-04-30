import 'package:coonet/pages/PaginaChat.dart';
import 'package:coonet/pages/PaginaNuevaOferta.dart';
import 'package:coonet/pages/PaginaTienda.dart';
import 'package:flutter/material.dart';
import './PaginaHome.dart';
import 'ServicioWidget.dart';
import 'Test.dart';
import 'Users/FreeLancer.dart';
import 'PaginaUsr.dart';
import 'imagen.dart';

class Menu extends StatefulWidget {
  static String id = 'Menu_page';
  @override
  _MenuBare createState() => _MenuBare();
}

class _MenuBare extends State<Menu> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [
    TestWidget(),
    PaginaChat(),
    PaginaNuevaOferta(),
    HomePage(),
    PaginaUsr(free: fetchPost()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coonet',
      home: Scaffold(
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(221, 255, 255, 255),
          selectedItemColor: const Color.fromARGB(255, 245, 76, 253),
          unselectedItemColor: const Color.fromARGB(255, 102, 102, 255),
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervised_user_circle,
                  size: 30,
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}

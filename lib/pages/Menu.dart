import 'package:coonet/pages/EditarPerfil.dart';
import 'package:coonet/pages/PaginaChat.dart';
import 'package:coonet/pages/PaginaNuevaOferta.dart';
import 'package:coonet/pages/PaginaTienda.dart';
import 'package:flutter/material.dart';
import 'PaginaHome.dart';
import 'ServicioWidget.dart';
import 'Users/FreeLancer.dart';
import 'PaginaUsr.dart';
import 'imagen.dart';

int paginaActual = 0;
class Menu extends StatefulWidget {
  static String id = 'Menu_page';
  @override
  _MenuBare createState() => _MenuBare();
}
 
class _MenuBare extends State<Menu> {
 

  final List<Widget> _paginas = [
    PaginaHome(),
    PaginaChat(),
    PaginaNuevaOferta(),
    PaginaTienda(),
    PaginaUsr(free: fetchPost()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coonet',
      home: Scaffold(
        body: _paginas[paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(221, 255, 255, 255),
          selectedItemColor: const Color.fromARGB(255, 245, 76, 253),
          unselectedItemColor: const Color.fromARGB(255, 102, 102, 255),
          onTap: (index) {
            setState(() {
              paginaActual = index;
            });
          },
          currentIndex: paginaActual,
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

import 'package:coonet/pages/PaginaLogin.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamChatClient _client;
  int _paginaActual = 0;

  List<Widget> _paginas = [PaginaLogin()];
  @override
  void initState() {
    // TODO: implement initState
    _client = StreamChatClient(
      've7dt9crz9er',
      logLevel: Level.INFO,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      builder: (context, child) {
        return StreamChat(child: child, client: _client);
      },
      home: _paginas[_paginaActual],
    );
  }
}

/*import 'package:coonet/pages/PaginaLogin.dart';
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
}*/
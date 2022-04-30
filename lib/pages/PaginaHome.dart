import 'package:flutter/material.dart';
import 'Users/FreeLancer.dart';
import 'PaginaUsr.dart';

class PaginaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
            ofertas(context),
          ],
        ),
      ),
    );
  }

  Widget ofertas(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(123, 217, 90, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Expanded(
                flex: 5,
                child: Image(
                    image: NetworkImage(
                        'https://edit.org/photos/images/cat/logos-big-2019090615.jpg-1300.jpg'))),
            const Spacer(flex: 1),
            Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sahil Krzy",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                        child: Text(
                          "Hago logos a buen precio ya sea para empresas grandes o pequeñas!",
                          style: TextStyle(
                              fontFamily: 'Arial', color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PaginaUsr(free: fetchPost())))
                            },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.chat,
                              color: Color.fromARGB(255, 174, 0, 255),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Contactar",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 174, 0, 255)))
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 255, 255, 255),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

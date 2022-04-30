import 'package:flutter/material.dart';

class TestDesplegable extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Pagkk());
  }
}

//https://docs.flutter.dev/development/ui/widgets/cupertino

class Pagkk extends StatefulWidget{
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Pagkk>{
  String texto = "ningun valor selecionado";
  String vactu = "app";
  //List _lista = ['Diseño', 'Programación', 'Edición'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nueva oferta", style: TextStyle(fontSize: 30),),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.png'),
                fit: BoxFit.cover,
            ),
          ),
          child: Column(

            children: <Widget>[
              SizedBox(height: 15.0,),
              _tit(),
              SizedBox(height: 15.0,),
              _desc(),

              Container(
                alignment: Alignment.topLeft,
                child: DropdownButton<String>(
                    hint: Text(texto),
                    dropdownColor: Colors.black12,
                    value: vactu,
                    items: const [
                      DropdownMenuItem(
                        child: Text('Apps', style: TextStyle(
                          color: Colors.white,
                          ),
                        ),
                        value: "app",),
                      DropdownMenuItem(
                        child: Text('Web', style: TextStyle(
                          color: Colors.white,
                          ),
                        ),
                        value: "web",),
                      DropdownMenuItem(
                        child: Text('Edición', style: TextStyle(
                        color: Colors.white,
                          ),
                        ),
                        value: "edicion",),
                    ],

                    onChanged: (valor){
                      setState((){
                        texto = valor!;
                        vactu = valor;
                      });
                    }
                ),
              ),
              SizedBox(height: 15.0,),
              _prec(),
            ],
          ),
        ),
    );
  }

  Widget _tit(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapsot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }

  Widget _desc(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapsot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Descripción',
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }
  Widget _prec(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapsot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Precio',
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }
}
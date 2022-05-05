
import 'package:coonet/pages/PaginaTienda.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import 'PaginaRegistro.dart';

class PaginaChat extends StatelessWidget{

@override
  Widget build(BuildContext context){
    
    return Scaffold(
      
       body: Container (decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fondo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
        children: 
            [
              
          const Padding(padding: EdgeInsets.only(left: 20, top: 30, bottom: 5), child: Text("MENSAJES", style: TextStyle(fontFamily: 'Arial', fontSize: 30, color: Colors.white),),),
         
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),
              ofertas2(context),

             
          ],),
      ),
    );
  }


  Widget ofertas2(BuildContext context){
    
    return  Card(
      color: Color.fromARGB(171, 255, 255, 255),

      //TODO cambiar card por container
      child: InkWell(
    onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaginaTienda()));
           
    },
  
    child: Padding(
      
      padding: EdgeInsets.all(10),
      
        child: Column(  
          
          mainAxisSize: MainAxisSize.min,  
          children: <Widget>[
            Row(
              children: [
              CircleAvatar(
                radius: 30.0,
                child: ClipOval(
                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/c/cf/Payaso_Cucharita.jpg',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                  ),
              ),
              const SizedBox(width: 20),
                const Text("Sahil", style: TextStyle(
                    fontSize: 20.0,
                  )
                ),
              ],
            )
            
          ],  
        
        ), 
    ),
      ),
  );
  
  }
}


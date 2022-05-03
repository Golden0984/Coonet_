import 'dart:convert';
import 'dart:io';
import 'package:numberpicker/numberpicker.dart';
import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaLogin.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
class PaginaNuevaOferta extends StatefulWidget{
  static String id = 'Register_page';

  @override
  _OfertaPageState createState() => _OfertaPageState();
}

class _OfertaPageState extends State<PaginaNuevaOferta>{
  String texto = "ningun valor selecionado";
  String vactu = "app";
  File? _image, _image2, _image3, _image4;
  int index = 0;
  final _picker = ImagePicker();
  List<Asset> images = <Asset>[];
  List<XFile>_imageList = [];
  // Implementing the image picker
  /*Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        //print(File(pickedImage.path));
        switch(index) { 
          case 0: { 
            _image = File(pickedImage.path);
        _imageList.add(pickedImage);
        print(_imageList.toString());
        index++;
          } 
          break; 
          
          case 1: { 
            _image2 = File(pickedImage.path);
            _imageList.add(pickedImage);
            print(_imageList.toString());
            index++;
          } 
          break; 
              
          case 2: { 
            _image3 = File(pickedImage.path);
            _imageList.add(pickedImage);
            print(_imageList.toString());
            index++;
          } 
          break; 

          case 3: { 
            _image4 = File(pickedImage.path);
            _imageList.add(pickedImage);
            print(_imageList.toString());
            index++;
          } 
          break; 
        }
        
       // print(_image);
      });
    }
  }*/


  
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
        child: ListView(
          children: [
            const SizedBox(height: 40.0,),
            const Text('Nueva Oferta', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: Colors.white,   )),
            const SizedBox(height: 20.0,),
            _tituloTextField(),
            const SizedBox(height: 10,),
            _DesTextField(),
            const SizedBox(height: 10,),
            _catTextField(),
            const SizedBox(height: 10,),
            _precioTextField(),
            const SizedBox(height: 25.0,),
            _SubirImagen(_image),
            const SizedBox(height: 25.0,),
            _SubirImagen(_image2),
            const SizedBox(height: 25.0,),
            _SubirImagen(_image3),
            const SizedBox(height: 25.0,),
            _botonSeleccionar(),
            const SizedBox(height: 25.0,),
            _buttonCreate(),
            const SizedBox(height: 25.0, ),
          ],
        ),
      ),
    );
  }

  Widget _tituloTextField(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              //controller: tituloctrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                
                icon: Icon(Icons.abc, color: Colors.white,),
                //hintText: 'Alex',
                labelText: 'Titulo',
                labelStyle: TextStyle(
                  color: Colors.white,
                )
                
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }
  Widget _DesTextField(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              //controller: apellidosctrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                icon: Icon(Icons.abc, color: Colors.white,),
                //hintText: 'ejemplo@email.com',
                labelText: 'Descripción',
                labelStyle: TextStyle(
                  color: Colors.white,
                )
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }
  Widget _catTextField(){
    return Container(
      padding: const EdgeInsets.only(left: 60,right: 20),
      alignment: Alignment.center,
      child: DropdownButton<String>(
        icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
        isExpanded: true,
        hint: Text(texto),
        dropdownColor: Colors.black45,
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
    );
  }
  Widget _precioTextField(){
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              //controller: telefonoctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                icon: Icon(Icons.euro, color: Colors.white,),
                labelText: 'Precio',
                labelStyle: TextStyle(
                  color: Colors.white,
                )
              ),
              onChanged: (value){
              },
            ),
          );
        }
    );
  }

   Widget _SubirImagen(File? _image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              ),
            ]),
          ),
        );
  }

  Widget _botonSeleccionar(){
      return ElevatedButton(
                  child: const Text('Select An Image'),
                  onPressed: loadAssets(),
      );
  }

  Widget _buttonCreate(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return ElevatedButton(
            child: Container(
              width: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15.0),
              alignment: Alignment.center,
              child: 
              const Text('Crear',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            style: ElevatedButton.styleFrom (
              primary: const Color.fromARGB(255, 200, 255, 0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {}
          );
        }
      ),
    );
  }


  List<Asset> imagesk = <Asset>[];

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
     // _error = error;
    });
  }
}
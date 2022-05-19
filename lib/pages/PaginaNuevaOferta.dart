import 'dart:convert';
import 'dart:io';

import 'package:coonet/pages/Menu.dart';

import 'package:coonet/pages/Users/FreeLancer.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

class PaginaNuevaOferta extends StatefulWidget {
  static String id = 'Register_page';

  @override
  _OfertaPageState createState() => _OfertaPageState();
}

class _OfertaPageState extends State<PaginaNuevaOferta> {
  String texto = "ningun valor selecionado";
  String vactu = " ";

  late TextEditingController tituloctrl = TextEditingController();
  late TextEditingController descripcionctrl = TextEditingController();
  late TextEditingController precioctrl = TextEditingController();
  late TextEditingController categoctrl = TextEditingController();

  File? _image, _image2, _image3, _image4;

  int index = 0;
  final _picker = ImagePicker();
  List<XFile> _imageList = [];
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (index > 3) {
          index = 0;
        }
        //print(File(pickedImage.path));
        switch (index) {
          case 0:
            {
              _image = File(pickedImage.path);
              _imageList.add(pickedImage);
              print(_imageList.toString());
              index++;
            }
            break;

          case 1:
            {
              _image2 = File(pickedImage.path);
              _imageList.add(pickedImage);
              print(_imageList.toString());
              index++;
            }
            break;

          case 2:
            {
              _image3 = File(pickedImage.path);
              _imageList.add(pickedImage);
              print(_imageList.toString());
              index++;
            }
            break;

          case 3:
            {
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
  }

  Dio dio = new Dio();

  Future<void> _Subir() async {
    String filename = _image!.path.split('/').last;

    FormData formData = FormData.fromMap({
      "email": login,
      "titulo": tituloctrl.text,
      "descripcion": descripcionctrl.text,
      "categoria": vactu,
      "precio": precioctrl.text,
      'foto1': await MultipartFile.fromFile(_image!.path, filename: filename),
      'foto2': await MultipartFile.fromFile(_image2!.path, filename: filename),
      'foto3': await MultipartFile.fromFile(_image3!.path, filename: filename),
      'foto4': await MultipartFile.fromFile(_image4!.path, filename: filename)
    });

    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/CrearOferta.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'si') {
        Fluttertoast.showToast(
            msg: "Oferta Creada Correctamente",
            toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina
        {
          paginaActual = 0;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Menu()));
        }
      } else if (value.toString() == 'no') {
        Fluttertoast.showToast(
            msg: "Error Imagen", toastLength: Toast.LENGTH_SHORT);
      } else if (value.toString() == 'Error User') {
        Fluttertoast.showToast(
            msg: "Error User", toastLength: Toast.LENGTH_SHORT);
      } else {
        print(value.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 40.0,
            ),
            const Text('Nueva Oferta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 20.0,
            ),
            _tituloTextField(),
            const SizedBox(
              height: 10,
            ),
            _DesTextField(),
            const SizedBox(
              height: 10,
            ),
            _catTextField(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              indent: 60,
              endIndent: 60,
              color: Color.fromARGB(110, 255, 255, 255),
            ),
            const SizedBox(
              height: 10,
            ),
            _precioTextField(),
            const SizedBox(
              height: 25.0,
            ),
            _precio2TextField(),
            const SizedBox(
              height: 25.0,
            ),
            _precio3TextField(),
            const SizedBox(
              height: 25.0,
            ),
            _SubirImagen(),
            const SizedBox(
              height: 25.0,
            ),
            _buttonCreate(),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tituloTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: tituloctrl,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.title_rounded,
                color: Colors.white,
              ),
              //hintText: 'Alex',
              labelText: 'Titulo',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _DesTextField() {
    final maxLines = 5;
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: EdgeInsets.all(0),
        height: maxLines * 24.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          controller: descripcionctrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.description,
                color: Colors.white,
              ),
              //hintText: 'ejemplo@email.com',
              labelText: 'Descripción',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _catTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          isExpanded: true,
          hint: Text(texto),
          dropdownColor: Color.fromARGB(255, 44, 44, 44),
          value: vactu,
          items: const [
            DropdownMenuItem(
              child: Text(
                'Seleccionar Categoria',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: " ",
            ),
            DropdownMenuItem(
              child: Text(
                'Creación apps',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "app",
            ),
            DropdownMenuItem(
              child: Text(
                'Programación',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "programacion",
            ),
            DropdownMenuItem(
              child: Text(
                'Diseño web',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "disenoweb",
            ),
            DropdownMenuItem(
              child: Text(
                'Edición de video',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "videoEditig",
            ),
            DropdownMenuItem(
              child: Text(
                'Edición Fotos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "editfotos",
            ),
            DropdownMenuItem(
              child: Text(
                'Producción Video',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "produvideo",
            ),
          ],
          onChanged: (valor) {
            setState(() {
              texto = valor!;
              vactu = valor;
            });
          }),
    );
  }

  Widget _precioTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: precioctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.euro,
                color: Colors.white,
              ),
              labelText: 'Precio 1',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _precio2TextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: precioctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.euro,
                color: Colors.white,
              ),
              labelText: 'Precio 2',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _precio3TextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: precioctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              icon: Icon(
                Icons.euro,
                color: Colors.white,
              ),
              labelText: 'Precio 3',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _SubirImagen() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buttonSelect(),
            const SizedBox(
              height: 10.0,
            ),
            Row(children: [
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen(_image),
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen(_image2),
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen(_image3),
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen(_image4),
            ]),
            const SizedBox(
              height: 10.0,
            ),
            _buttonBorrar(),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectimagen(File? _image) {
    return Row(children: [
      Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        color: Colors.grey[300],
        child: _image != null
            ? Image.file(_image, fit: BoxFit.fill)
            : Icon(Icons.no_photography),
      ),
    ]);
  }

  Widget _buttonSelect() {
    return Center(
      child: ElevatedButton(
        child: const Text('Select An Image'),
        onPressed: _openImagePicker,
      ),
    );
  }

  Widget _buttonBorrar() {
    return Center(
      child: ElevatedButton(
        child: const Text('Restablecer selección'),
        onPressed: () {
          setState(() {
            _image = null;
            _image2 = null;
            _image3 = null;
            _image4 = null;
            index = 0;
          });
        },
      ),
    );
  }

  Widget _buttonCreate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
                width: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
                alignment: Alignment.center,
                child: const Text(
                  'Crear',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 200, 255, 0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _Subir());
      }),
    );
  }
}

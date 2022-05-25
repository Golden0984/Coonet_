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
  late TextEditingController descripcion_E = TextEditingController();
  late TextEditingController precio_E = TextEditingController();
  late TextEditingController descripcion_S = TextEditingController();
  late TextEditingController precio_S = TextEditingController();
  late TextEditingController descripcion_P = TextEditingController();
  late TextEditingController precio_P = TextEditingController();

  bool _vacioTitulo = false;
  bool _vacioDescp1 = false;
  bool _vacioDescp2 = false;
  bool _vacioDescp3 = false;
  bool _vacioDescp4 = false;
  bool _vacioPrecio1 = false;
  bool _vacioPrecio2 = false;
  bool _vacioPrecio3 = false;
  bool _vacioPrecio4 = false;
  bool _valPrecio1 = false;
  bool _valPrecio2 = false;
  bool _valPrecio3 = false;
  bool _compPrecio1 = false;
  bool _compPrecio2 = false;
  bool _compPrecio3 = false;
  bool _valCategoria = false;

  RegExp precio = RegExp(r'^[0-9]{1,}$');

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
      });
    }
  }

  Dio dio = new Dio();

  Future<void> _Subir() async {
    if (tituloctrl.text.trim().isEmpty ||
        descripcionctrl.text.trim().isEmpty ||
        descripcion_E.text.trim().isEmpty ||
        precio_E.text.trim().isEmpty ||
        descripcion_S.text.trim().isEmpty ||
        precio_S.text.trim().isEmpty ||
        descripcion_P.text.trim().isEmpty ||
        precio_P.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: "Hay campos vacios.", toastLength: Toast.LENGTH_SHORT);
    } else {
      if (_image == null ||
          _image2 == null ||
          _image3 == null ||
          _image4 == null) {
        Fluttertoast.showToast(
            msg: "Has de selecionar las 4 imagenes",
            toastLength: Toast.LENGTH_SHORT);
      } else if (vactu == " ") {
        Fluttertoast.showToast(
            msg: "Debes selecionar una categoria",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        String filename = _image!.path.split('/').last;

        FormData formData = FormData.fromMap({
          "email": login,
          "titulo": tituloctrl.text,
          "descripcion": descripcionctrl.text,
          "categoria": vactu,
          "descripcion_E": descripcion_E.text,
          "precio_E": precio_E.text,
          "descripcion_S": descripcion_S.text,
          "precio_S": precio_S.text,
          "descripcion_P": descripcion_P.text,
          "precio_P": precio_P.text,
          'foto1':
              await MultipartFile.fromFile(_image!.path, filename: filename),
          'foto2':
              await MultipartFile.fromFile(_image2!.path, filename: filename),
          'foto3':
              await MultipartFile.fromFile(_image3!.path, filename: filename),
          'foto4':
              await MultipartFile.fromFile(_image4!.path, filename: filename)
        });

        await dio
            .post(
                'https://phpninjahosting.com/manish/Coonet/Php/CrearOferta.php',
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
    }
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
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: Text(
                'PLAN ECONÓMICO',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _DesPlan1(),
            const SizedBox(
              height: 10,
            ),
            _precioTextField(),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              indent: 60,
              endIndent: 60,
              color: Color.fromARGB(110, 255, 255, 255),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: Text(
                'PLAN ESTÁNDAR',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _DesPlan2(),
            const SizedBox(
              height: 10.0,
            ),
            _precio2TextField(),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              indent: 60,
              endIndent: 60,
              color: Color.fromARGB(110, 255, 255, 255),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: Text(
                'PLAN PREMIUM',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _DesPlan3(),
            const SizedBox(
              height: 10,
            ),
            _precio3TextField(),
            const SizedBox(
              height: 10.0,
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
          decoration: InputDecoration(
             errorText: _vacioTitulo ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (tituloctrl.text.isEmpty || tituloctrl.text == " ") ? _vacioTitulo = true : _vacioTitulo = false;
            });
          },
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
          decoration: InputDecoration(
            errorText: _vacioDescp1 ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (descripcionctrl.text.isEmpty || descripcionctrl.text == " ") ? _vacioDescp1 = true : _vacioDescp1 = false;
            });
          },
        ),
      );
    });
  }

  Widget _catTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            errorText: _valCategoria ? 'Selecciona una categoria' : null,
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
              (vactu == " ") ? _valCategoria = true : _valCategoria = false;
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
          controller: precio_E,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: _vacioPrecio1 ? 'No se puede dejar vacio' : _valPrecio1 ? 'No puede ser mayor que el Estándar y el Premium' : _compPrecio1 ? 'Precio  invalido' : null,
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
              labelText: 'Precio',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              (precio_E.text.isEmpty || precio_E.text == " ") ? _vacioPrecio1 = true : _vacioPrecio1 = false;
              !precio.hasMatch(precio_E.text) ? _compPrecio1 =  true : _compPrecio1 = false;
              (int.parse(precio_E.text) > int.parse(precio_S.text) || int.parse(precio_E.text) > int.parse(precio_P.text)) ? _valPrecio1 = true : _valPrecio1 = false;
            });
          },
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
          controller: precio_S,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              errorText: _vacioPrecio2 ? 'No se puede dejar vacio' : _valPrecio2 ? 'No puede ser menor que el Económico y mayor que el Premium' : _compPrecio2 ? 'Precio  invalido' : null,
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
              labelText: 'Precio',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              (precio_S.text.isEmpty || precio_S.text == " ") ? _vacioPrecio2 = true : _vacioPrecio2 = false;
              !precio.hasMatch(precio_S.text) ? _compPrecio2 =  true : _compPrecio2 = false;
              (int.parse(precio_E.text) > int.parse(precio_S.text) || int.parse(precio_S.text) > int.parse(precio_P.text)) ? _valPrecio2 = true : _valPrecio2 = false;
            });
          },
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
          controller: precio_P,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: _vacioPrecio3 ? 'No se puede dejar vacio' : _valPrecio3 ? 'No puede ser menor que los otros planes' : _compPrecio3 ? 'Precio  invalido' : null,
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
              labelText: 'Precio',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              (precio_P.text.isEmpty || precio_P.text == " ") ? _vacioPrecio3 = true : _vacioPrecio3 = false;
              !precio.hasMatch(precio_P.text) ? _compPrecio3 =  true : _compPrecio3 = false;
              (int.parse(precio_E.text) > int.parse(precio_P.text) || int.parse(precio_S.text) > int.parse(precio_P.text)) ? _valPrecio3 = true : _valPrecio3 = false;
            });
          },
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
            const SizedBox(
              height: 15.0,
            ),
            Text("SELECCIONAR IMAGENES", style: TextStyle(color: Colors.white),),
            const SizedBox(
              height: 15.0,
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
            : IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {_openImagePicker();  },),
      ),
    ]);
  }

  Widget _buttonSelect() {
    return Center(
      child: ElevatedButton(
        child: const Text('Select An Image',),
        onPressed: _openImagePicker,
      ),
    );
  }

  Widget _buttonBorrar() {
    return Center(
      child: ElevatedButton(
        child: const Text('Restablecer selección', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
        style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 255, 255, 255),),
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

  Widget _DesPlan1() {
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
          controller: descripcion_E,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorText: _vacioDescp2 ? 'No se puede dejar vacio' : null,
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
              labelText: 'Descripción',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {
            setState(() {
              (descripcion_E.text.isEmpty || descripcion_E.text == " ") ? _vacioDescp2 = true : _vacioDescp2 = false;
            });
          },
        ),
      );
    });
  }

  Widget _DesPlan2() {
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
          controller: descripcion_S,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: _vacioDescp3 ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (descripcion_S.text.isEmpty || descripcion_S.text == " ") ? _vacioDescp3 = true : _vacioDescp3 = false;
            });
          },
        ),
      );
    });
  }

  Widget _DesPlan3() {
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
          controller: descripcion_P,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: _vacioDescp4 ? 'No se puede dejar vacio' : null,
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
          onChanged: (value) {
            setState(() {
              (descripcion_P.text.isEmpty || descripcion_P.text == " ") ? _vacioDescp4 = true : _vacioDescp4 = false;
            });
          },
        ),
      );
    });
  }
}

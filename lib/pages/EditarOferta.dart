import 'dart:io';

import 'package:coonet/pages/Menu.dart';

import 'package:coonet/pages/Users/FreeLancer.dart';
import 'package:coonet/pages/Users/InfoAnuncio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

import 'MisProyectos.dart';

class EditarOferta extends StatefulWidget {
  static String id = 'Register_page';

  @override
  _OfertaPageState createState() => _OfertaPageState();
}

class _OfertaPageState extends State<EditarOferta> {
  String texto = "ningun valor selecionado";
  String vactu = " ";

  late TextEditingController tituloctrl = TextEditingController();
  late TextEditingController descripcionctrl = TextEditingController();
  late TextEditingController descripcion_Eco = TextEditingController();
  late TextEditingController precio_Eco = TextEditingController();
  late TextEditingController descripcion_Sta = TextEditingController();
  late TextEditingController precio_Sta = TextEditingController();
  late TextEditingController descripcion_Pre = TextEditingController();
  late TextEditingController precio_Pre = TextEditingController();

  File? _image, _image2, _image3, _image4;

  int index = 0;
  final _picker = ImagePicker();
  List<XFile> _imageList = [];

  @override
  void initState() {
    tituloctrl.text = titulo;
    descripcionctrl.text = descripcion;
    descripcion_Eco.text = descripcion_E;
    precio_Eco.text = precio_E;
    descripcion_Sta.text = descripcion_S;
    precio_Sta.text = precio_S;
    descripcion_Pre.text = descripcion_P;
    precio_Pre.text = precio_P;
    vactu = categoria;
  }

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

  Future<void> _Subir(String validar) async {
    if (validar == "si") {
      if (tituloctrl.text.trim().isEmpty ||
          descripcionctrl.text.trim().isEmpty ||
          descripcion_Eco.text.trim().isEmpty ||
          precio_Eco.text.trim().isEmpty ||
          descripcion_Sta.text.trim().isEmpty ||
          precio_Sta.text.trim().isEmpty ||
          descripcion_Pre.text.trim().isEmpty ||
          precio_Pre.text.trim().isEmpty) {
        Fluttertoast.showToast(
            msg: "Hay campos vacios.", toastLength: Toast.LENGTH_SHORT);
      } else if (vactu == " ") {
        Fluttertoast.showToast(
            msg: "Debes selecionar una categoria",
            toastLength: Toast.LENGTH_SHORT);
      } else {
        if (_image == null &&
            _image2 == null &&
            _image3 == null &&
            _image4 == null) {
          FormData formData = FormData.fromMap({
            "id_anuncio": id_anuncio,
            "titulo": tituloctrl.text,
            "descripcion": descripcionctrl.text,
            "categoria": vactu,
            "descripcion_E": descripcion_Eco.text,
            "precio_E": precio_Eco.text,
            "descripcion_S": descripcion_Sta.text,
            "precio_S": precio_Sta.text,
            "descripcion_P": descripcion_Pre.text,
            "precio_P": precio_Pre.text,
            'foto1': "no",
            'foto2': "no",
            'foto3': "no",
            'foto4': "no",
          });

          Update(formData);
        } else if (_image != null &&
            _image2 == null &&
            _image3 == null &&
            _image4 == null) {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "id_anuncio": id_anuncio,
            "titulo": tituloctrl.text,
            "descripcion": descripcionctrl.text,
            "categoria": vactu,
            "descripcion_E": descripcion_Eco.text,
            "precio_E": precio_Eco.text,
            "descripcion_S": descripcion_Sta.text,
            "precio_S": precio_Sta.text,
            "descripcion_P": descripcion_Pre.text,
            "precio_P": precio_Pre.text,
            'foto1':
                await MultipartFile.fromFile(_image!.path, filename: filename),
            'foto2': "no",
            'foto3': "no",
            'foto4': "no",
          });
          Update(formData);
        } else if (_image != null &&
            _image2 != null &&
            _image3 == null &&
            _image4 == null) {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "id_anuncio": id_anuncio,
            "titulo": tituloctrl.text,
            "descripcion": descripcionctrl.text,
            "categoria": vactu,
            "descripcion_E": descripcion_Eco.text,
            "precio_E": precio_Eco.text,
            "descripcion_S": descripcion_Sta.text,
            "precio_S": precio_Sta.text,
            "descripcion_P": descripcion_Pre.text,
            "precio_P": precio_Pre.text,
            'foto1':
                await MultipartFile.fromFile(_image!.path, filename: filename),
            'foto2':
                await MultipartFile.fromFile(_image2!.path, filename: filename),
            'foto3': "no",
            'foto4': "no",
          });
          Update(formData);
        } else if (_image != null &&
            _image2 != null &&
            _image3 != null &&
            _image4 == null) {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "id_anuncio": id_anuncio,
            "titulo": tituloctrl.text,
            "descripcion": descripcionctrl.text,
            "categoria": vactu,
            "descripcion_E": descripcion_Eco.text,
            "precio_E": precio_Eco.text,
            "descripcion_S": descripcion_Sta.text,
            "precio_S": precio_Sta.text,
            "descripcion_P": descripcion_Pre.text,
            "precio_P": precio_Pre.text,
            'foto1':
                await MultipartFile.fromFile(_image!.path, filename: filename),
            'foto2':
                await MultipartFile.fromFile(_image2!.path, filename: filename),
            'foto3':
                await MultipartFile.fromFile(_image3!.path, filename: filename),
            'foto4': "no",
          });
          Update(formData);
        } else {
          String filename = _image!.path.split('/').last;

          FormData formData = FormData.fromMap({
            "id_anuncio": id_anuncio,
            "titulo": tituloctrl.text,
            "descripcion": descripcionctrl.text,
            "categoria": vactu,
            "descripcion_E": descripcion_Eco.text,
            "precio_E": precio_Eco.text,
            "descripcion_S": descripcion_Sta.text,
            "precio_S": precio_Sta.text,
            "descripcion_P": descripcion_Pre.text,
            "precio_P": precio_Pre.text,
            'foto1':
                await MultipartFile.fromFile(_image!.path, filename: filename),
            'foto2':
                await MultipartFile.fromFile(_image2!.path, filename: filename),
            'foto3':
                await MultipartFile.fromFile(_image3!.path, filename: filename),
            'foto4':
                await MultipartFile.fromFile(_image4!.path, filename: filename)
          });
          Update(formData);
        }
      }
    }else{
      {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisProyectos()));
        }
    }
  }

  Update(FormData formData) async {
    await dio
        .post('https://phpninjahosting.com/manish/Coonet/Php/EditarAnuncio.php',
            data: formData)
        .then((value) {
      if (value.toString() == 'si') {
        Fluttertoast.showToast(
            msg: "Se ha editado Correctamente la oferta",
            toastLength: Toast.LENGTH_SHORT);
        //Ir a otra pagina
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MisProyectos()));
        }
      } else if (value.toString() == 'no') {
        Fluttertoast.showToast(
            msg: "Error al guardar los datos", toastLength: Toast.LENGTH_SHORT);
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      showDialog();
                    },
                  ),
                ),
                const Text('EDITAR OFERTA',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ))
              ],
            ),
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
                'PLAN ECON??MICO',
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
                'PLAN EST??NDAR',
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
              labelText: 'Descripci??n',
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
                'Creaci??n apps',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "app",
            ),
            DropdownMenuItem(
              child: Text(
                'Programaci??n',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "programacion",
            ),
            DropdownMenuItem(
              child: Text(
                'Dise??o web',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "disenoweb",
            ),
            DropdownMenuItem(
              child: Text(
                'Edici??n de video',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "videoEditig",
            ),
            DropdownMenuItem(
              child: Text(
                'Edici??n Fotos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              value: "editfotos",
            ),
            DropdownMenuItem(
              child: Text(
                'Producci??n Video',
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
          controller: precio_Eco,
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
              labelText: 'Precio',
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
          controller: precio_Sta,
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
              labelText: 'Precio',
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
          controller: precio_Pre,
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
              labelText: 'Precio',
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
              _selectimagen2(_image2),
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen3(_image3),
              const SizedBox(
                width: 5.0,
              ),
              _selectimagen4(_image4),
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
            : Image.network(
                foto1,
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
      ),
    ]);
  }

  Widget _selectimagen2(File? _image) {
    return Row(children: [
      Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        color: Colors.grey[300],
        child: _image != null
            ? Image.file(_image, fit: BoxFit.fill)
            : Image.network(
                foto2,
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
      ),
    ]);
  }

  Widget _selectimagen3(File? _image) {
    return Row(children: [
      Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        color: Colors.grey[300],
        child: _image != null
            ? Image.file(_image, fit: BoxFit.fill)
            : Image.network(
                foto3,
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
      ),
    ]);
  }

  Widget _selectimagen4(File? _image) {
    return Row(children: [
      Container(
        alignment: Alignment.center,
        width: 80,
        height: 80,
        color: Colors.grey[300],
        child: _image != null
            ? Image.file(_image, fit: BoxFit.fill)
            : Image.network(
                foto4,
                fit: BoxFit.cover,
                width: 100.0,
                height: 100.0,
              ),
      ),
    ]);
  }

  Widget _buttonSelect() {
    return Center(
      child: ElevatedButton(
        child: const Text('Seleccionar Imagen'),
        onPressed: _openImagePicker,
      ),
    );
  }

  Widget _buttonBorrar() {
    return Center(
      child: ElevatedButton(
        child: const Text('Restablecer selecci??n'),
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
                  'Guardar cambios',
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
            onPressed: () => _Subir("si"));
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
          controller: descripcion_Eco,
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
              labelText: 'Descripci??n',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
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
          controller: descripcion_Sta,
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
              labelText: 'Descripci??n',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
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
          controller: descripcion_Pre,
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
              labelText: 'Descripci??n',
              labelStyle: TextStyle(
                color: Colors.white,
              )),
          onChanged: (value) {},
        ),
      );
    });
  }

  void showDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Guardar cambios"),
          content: Text("??Deseas guardar los cambios?"),
          actions: [
            CupertinoDialogAction(
                child: Text("SI"),
                onPressed: () {
                  _Subir("si");
                  Navigator.of(context).pop();
                }),
            CupertinoDialogAction(
                child: Text("NO"),
                onPressed: () {
                  _Subir("no");
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}

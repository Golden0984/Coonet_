import 'package:flutter/material.dart';

class ServicioWidget extends StatefulWidget {
  const ServicioWidget({Key? key}) : super(key: key);

  @override
  Servicios createState() => Servicios();
}

class Servicios extends State<ServicioWidget> {
  late PageController pageViewController = PageController();
  late String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            appbartt(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional(0, -1),
                    children: [
                      Container(
                        height: 540,
                        decoration: BoxDecoration(),
                        child: Container(
                          width: double.infinity,
                          height: 530,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView(
                                  controller: pageViewController,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Image.network(
                                      'https://static.designcise.com/img/inspiration/lelevien/fox-logo-01.png',
                                      width: 100,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              5.3,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://99designs-start-attachments.imgix.net/alchemy-pictures/2016%2F03%2F02%2F04%2F14%2F45%2Fb3adc9bb-697b-49d2-b23d-f5b02d5b59ff%2FA-565860_SavaStoic.png?auto=format&ch=Width%2CDPR&w=250&h=250',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://www.designevo.com/res/templates/thumb_small/cute-monkey-and-interesting-gaming.webp',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 470, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x430F1113),
                                  offset: Offset(0, -2),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            alignment: const AlignmentDirectional(0, 1),
                            child: Align(
                              alignment: const AlignmentDirectional(0, -0.15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 20, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: const [
                                            Text(
                                              'Logo Designer',
                                              style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Expanded(
                                          child: Text(
                                            '\10.00€',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: Text(
                      'Hola soy el mejor diseñador del mundo bla bla bla bla bla bla bla bla bla bla bla bla',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Product Description',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: Text(
                      'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appbartt() {
    return AppBar(
      title: Text('nomprodicto'),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
    );
  }
}

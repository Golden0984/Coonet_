import 'package:coonet/pages/Menu.dart';
import 'package:coonet/pages/PaginaChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'Users/FreeLancer.dart';


//https://www.youtube.com/watch?v=nGvPNG-f1-o

final ThemeData iOSTheme = new ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.grey[400],
  primaryColorBrightness: Brightness.dark,
);

final ThemeData androidTheme = new ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.green,
);

late final Future<FreeLan> free;
String defaultUserName = login;

void main() => runApp(new testChatInt());

class testChatInt extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return new MaterialApp(
      title: "Chat Application",
      theme: defaultTargetPlatform == TargetPlatform.iOS
        ? iOSTheme
        : androidTheme,
      home: new Chat(),
    );
  }
}



class Chat extends StatefulWidget {
  @override
  State createState() => new ChatWindow();
}

class ChatWindow extends State<Chat> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext ctx) {
    return  Scaffold(
      body: new Column(
        children: <Widget>[
           const SizedBox(height: 62.0 ),
           Container(
             color: Color.fromARGB(255, 120, 190, 255),
             child: Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 35,
                  ),
                              
                    onPressed: (){
                      paginaActual = 1;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                    },
                ),
              ),
              const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "MIS PROYECTOS",
                      style: TextStyle(
                        fontSize: 30, 
                        color: Colors.white
                    ),
                    ),
                  ),
            ],
          ),
        ),
        new Flexible(
            child: new ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: new EdgeInsets.all(6.0),
            )),
        new Divider(height: 1.0),
        new Container(
          child: _buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(ctx).cardColor),
        ),
      ]),
    );
  }


  Widget _buildComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String txt) {
                      setState(() {
                        _isWriting = txt.length > 0;
                      });
                    },
                    onSubmitted: _submitMsg,
                    decoration:
                      new InputDecoration.collapsed(hintText: "Escribe tu mensaje "),
                  ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                  ? new CupertinoButton(
                    child: new Text("Submit"),
                    onPressed: _isWriting ? () => _submitMsg(_textController.text)
                        : null
                )
                    : new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: 
                    
                        _isWriting
                      ? () => _submitMsg(_textController.text)
                        : null)
              
  
                    
                    
                    
                )
              
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
          ? new BoxDecoration(
            border:
              new Border(top: new BorderSide(color: Color.fromARGB(255, 0, 0, 0)))) :
              null
        ),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this,
        duration: new Duration(milliseconds: 800)
      ),
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }

  @override
  void dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

}

class Msg extends StatelessWidget {
  Msg({required this.txt, required this.animationController});
  final String txt;
  final AnimationController animationController;

  @override
  Widget build(BuildContext ctx) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(
                child: new Text(
                  defaultUserName[0],
                ),
              ),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(defaultUserName, style: Theme.of(ctx).textTheme.subtitle1),
                  new Container(
                    margin: const EdgeInsets.only(top: 6.0),
                    child: new Text(txt),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

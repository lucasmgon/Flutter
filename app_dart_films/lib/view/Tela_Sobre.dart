import 'package:flutter/material.dart';
import 'package:share/share.dart';

class TelaSobre extends StatefulWidget {
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '© Dart Films - 1.0\n' +
              'Desenvolvido por:\n' +
              '\t- Eduardo\n' +
              '\t- José\n' +
              '\t- Lucas Matheus\n' +
              '2020 - SI8',
            ),
            IconButton(
                        onPressed: (){
                          Share.share('Confira mais em: https://www.themoviedb.org/movie/', subject: 'Dart Films Compartilhamento');
                        },
                        icon: Icon(Icons.share, color: Colors.blue, size: 20, semanticLabel: 'Compartilhar'),
                      ),
          ],
        ),
      ),
    );
  }
}
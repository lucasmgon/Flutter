import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Center(
                child: Text('\n\n\n\n\t© Dart Films - 1.0\n\n' +
                    'Desenvolvido por:\n' +
                    'Eduardo de Miranda Vieira\n' +
                    'José Laurindo\n' +
                    'Lucas Matheus Gonçalves\n\n' +
                    '\t2020 - SI8\n', 
                  style: Theme.of(context).textTheme.headline4,
                )
              ),
            ),
            
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/tmbd.png',
                  semanticLabel: "Logo TMBD",
                ),
              Text(
                '\nEsse aplicativo faz uso da API TMDB',
                style: Theme.of(context).textTheme.headline2,
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
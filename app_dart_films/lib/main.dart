import 'package:flutter/material.dart';
import 'package:app_dart_films/view/Tela_Principal.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dart Films",
      theme: ThemeData(
        
        buttonTheme: ButtonThemeData(
          minWidth: 150,
          height: 33,
          buttonColor: Color.fromRGBO(105, 116, 122, 1.0)
        ),

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 16, fontFamily: 'OpenSansBold'),
          headline2: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
        ),

        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(3, 101, 140, 1.0),
        accentColor: Colors.cyan[600],

        fontFamily: 'Sans-serif',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      //themeMode: ThemeMode.dark,
      home: TelaPrincipal(),
    )
  );
}

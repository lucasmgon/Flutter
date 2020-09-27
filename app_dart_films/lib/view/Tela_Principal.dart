import 'package:flutter/material.dart';
import 'package:app_dart_films/view/Tela_Series_Populares.dart';
import 'package:app_dart_films/view/Tela_Filmes_Populares.dart';
import 'package:app_dart_films/view/Tela_Sobre.dart';
import 'package:app_dart_films/model/Configuracao.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  _TelaPrincipalState createState() => _TelaPrincipalState(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Configuracao>(
          create: (_) => Configuracao(),
        ),
      ],
      child: TelaPrincipal(),
    ),
  );
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _selectedPage = 0;
  final _pageOptions = [
    ListFilmesPopulares(),
    ListSeriesPopulares(),
    TelaSobre(),
  ];

  Configuracao configuracao;
  bool systemIsDark;

  @override
  Widget build(BuildContext context) {
    bool darkThemeEnable = Provider.of<Configuracao>(context).isDark();
    
    configuracao = Provider.of<Configuracao>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text("Dart Films"),
          
          themeMode: darkThemeEnable ? ThemeMode.dark : ThemeMode.light,

          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            ),
            IconButton(
              icon: Icon(Icons.brightness_3),
              onPressed: (){
                trailing: Switch(
                  value: configuracao.isDark(),
                  onChanged: (configuracao){
                    configuracao.setDarkStatus(status);
                  },
                );
              },
            ),
          ],
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.airplay), title: Text('Filmes')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_queue), title: Text('Séries')),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline), title: Text('Sobre')),
          ],
        ),
    );
  }
}
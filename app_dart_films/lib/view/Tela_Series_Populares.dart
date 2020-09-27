import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:app_dart_films/model/Series.dart';

class ListSeriesPopulares extends StatefulWidget {
  @override
  _ListSeriesPopularesState createState() => _ListSeriesPopularesState();
}

class _ListSeriesPopularesState extends State<ListSeriesPopulares> {
  String url = 'https://api.themoviedb.org/3/tv/popular?api_key=5a49b9228c69834798c18442448e2dcc&language=pt-BR&page=1';

  List<Series> series = [];

  void getFilmes() async {
    http.Response resposta = await http.get(url);
    Map<String, dynamic> fromJson = convert.jsonDecode(resposta.body);
    List results = fromJson['results'];
    setState(() {
      series = results.map((series) => Series.fromJson(series)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getFilmes();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: series.length,
      itemBuilder: (ctx, index) { //aqui

        return Material(
          child:ListTile(
            hoverColor: Color.fromRGBO(145, 170, 185, 0.5),
            onTap: () {
              print(series[index].name);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      series[index].name,
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(series[index].sinopse),
                          Image.network('https://image.tmdb.org/t/p/w400' +
                            series[index].backdrop_path,
                            semanticLabel: "${series[index].name}", //Acessibilidade em texto
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      FlatButton(onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Fechar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )
                      ),
                      )
                    ],
                  );
                }
              );
            },
            title: Text(series[index].name),
          )
        );
      },
    );
  }
}

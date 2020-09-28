import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:app_dart_films/model/Series.dart';

class ListSeriesPopulares extends StatefulWidget {
  @override
  _ListSeriesPopularesState createState() => _ListSeriesPopularesState();
}

class _ListSeriesPopularesState extends State<ListSeriesPopulares> {
  String url = 'https://api.themoviedb.org/3/tv/popular?api_key=5a49b9228c69834798c18442448e2dcc&language=pt-BR&page=1';

  List<Series> series = [];

  void getSeries() async {
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
    getSeries();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: series.length,
      itemBuilder: (ctx, index) {
        return Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge, //forçar borda arrendondar
          borderRadius: BorderRadius.circular(25),

          child:ListTile(
            hoverColor: Color.fromRGBO(145, 170, 185, 0.5),
            onTap: () {
              print("${series[index].name}");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      series[index].name,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            '\t' + series[index].sinopse + '\n\n' + "(" + series[index].ano.substring(0, 4) +
                            ")" + '\nAvaliação: ' + series[index].avaliacao.toString() + '%' +'\n\n',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          
                          ClipRRect(
                            //Arredondar borda da imagem
                            borderRadius: BorderRadius.circular(9),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w400' +
                              series[index].backdrop_path,
                              semanticLabel: "${series[index].name}", //Acessibilidade em texto
                              errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                return Text('Não foi possível carregar a imagem. Por favor, tente novamente mais tarde');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    actions: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.favorite, color: Colors.pink, size: 20, semanticLabel: 'Avaliar'),
                      ),

                      IconButton(
                        onPressed: (){
                          Share.share(
                            'Confira mais em: https://www.themoviedb.org/movie/${series[index].id.toString()}-${series[index].name}',
                            subject: 'Dart Films Compartilhamento'
                            );
                        },
                        icon: Icon(Icons.share, color: Colors.blue, size: 20, semanticLabel: 'Compartilhar'),
                      ),

                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                      },
                        icon: Icon(Icons.close, color: Colors.cyan, size: 20, semanticLabel: 'Fechar'),
                      ),
                    ],
                  );
                }
              );
            },
            title: Text(
              series[index].name,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        );
      },
    );
  }
}

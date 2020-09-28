import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:app_dart_films/model/Filmes.dart';

class ListFilmesPopulares extends StatefulWidget {
  @override
  _ListFilmesPopularesState createState() => _ListFilmesPopularesState();
}

class _ListFilmesPopularesState extends State<ListFilmesPopulares> {
  String url = 'https://api.themoviedb.org/3/movie/popular?api_key=5a49b9228c69834798c18442448e2dcc&language=pt-BR&page=1';

  List<Filmes> filmes = [];

  void getFilmes() async {
    http.Response resposta = await http.get(url);
    Map<String, dynamic> fromJson = convert.jsonDecode(resposta.body);
    List results = fromJson['results'];
    setState(() {
      filmes = results.map((filme) => Filmes.fromJson(filme)).toList();
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
      itemCount: filmes.length,
      itemBuilder: (ctx, index) {
        return Material(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge, //forçar borda arrendondar
          borderRadius: BorderRadius.circular(25),

          child:ListTile(
            hoverColor: Color.fromRGBO(145, 170, 185, 0.5),
            onTap: () {
              print("${filmes[index].title}");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      filmes[index].title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            '\t' + filmes[index].sinopse + '\n\n' + "(" + filmes[index].ano.substring(0, 4) +
                            ")" + '\nAvaliação: ' + filmes[index].avaliacao.toString() + '%' +'\n\n',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          
                          ClipRRect(
                            //Arredondar borda da imagem
                            borderRadius: BorderRadius.circular(9),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w400' +
                              filmes[index].backdrop_path,
                              semanticLabel: "${filmes[index].title}", //Acessibilidade em texto
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
                            'Confira mais em: https://www.themoviedb.org/movie/${filmes[index].id.toString()}-${filmes[index].title}',
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
              filmes[index].title,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        );
      },
    );
  }
}

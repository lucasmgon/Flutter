class Filmes {
  final String title;
  final int id;
  final String sinopse;
  final double avaliacao;
  final String ano;
  final String backdrop_path;

  Filmes(this.title, this.id, this.sinopse, this.avaliacao, this.ano, this.backdrop_path);

  Filmes.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        sinopse = json['overview'],
        avaliacao = json['vote_average'],
        ano = json['release_date'],
        backdrop_path = json['backdrop_path'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'sinopse': sinopse,
        'avaliacao': avaliacao,
        'ano': ano,
        'backdrop_path': backdrop_path,
      };
}
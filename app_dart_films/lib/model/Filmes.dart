class Filmes {
  final String title;
  final String id;
  final String sinopse;
  final double avaliacao;
  final String data;
  final String backdrop_path;

  Filmes(this.title, this.id, this.sinopse, this.avaliacao, this.data, this.backdrop_path);

  Filmes.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        sinopse = json['overview'],
        avaliacao = json['vote_average'],
        data = json['release_date'],
        backdrop_path = json['backdrop_path'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'sinopse': sinopse,
        'avaliacao': avaliacao,
        'Ano': data,
        'backdrop_path': backdrop_path,
      };
}
class Filmes {
  final String title;
  final String sinopse;
  final String backdrop_path;

  Filmes(this.title, this.sinopse, this.backdrop_path);

  Filmes.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        sinopse = json['overview'],
        backdrop_path = json['backdrop_path'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'sinopse': sinopse,
        'backdrop_path': backdrop_path,
      };
}
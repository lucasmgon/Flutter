class Series {
  final String name;
  final int id;
  final String sinopse;
  final double avaliacao;
  final String ano;
  final String backdrop_path;

  Series(this.name, this.id, this.sinopse, this.avaliacao, this.ano, this.backdrop_path);

  Series.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        sinopse = json['overview'],
        avaliacao = json['vote_average'],
        ano = json['first_air_date'],
        backdrop_path = json['backdrop_path'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'sinopse': sinopse,
        'avaliacao': avaliacao,
        'ano': ano,
        'backdrop_path': backdrop_path,
      };
}
class Series {
  final String name;
  final String sinopse;
  final String backdrop_path;

  Series(this.name, this.sinopse, this.backdrop_path);

  Series.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        sinopse = json['overview'],
        backdrop_path = json['backdrop_path'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'sinopse': sinopse,
        'backdrop_path': backdrop_path,
      };
}
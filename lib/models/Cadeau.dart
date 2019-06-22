class Cadeau {
  final String name;
  final int price;
  final String description;
  final String picture;
  final String url;

  Cadeau({this.name, this.price, this.description, this.picture, this.url});

  factory Cadeau.fromJson(Map<String, dynamic> json) {
    return Cadeau(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      picture: json['picture'],
      url: json['url'],
    );
  }
}

class Cadeau {
  final String name;
  final int price;
  final String description;
  final String picture;
  final String link;

  Cadeau({this.name, this.price, this.description, this.picture, this.link});

  factory Cadeau.fromJson(Map<String, dynamic> json) {
    return Cadeau(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      picture: json['picture'],
      link: json['link'],
    );
  }
}

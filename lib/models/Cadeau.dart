class Cadeau {
  final String name;
  final String price;
  final String description;
  final String url;

  Cadeau({this.name, this.price, this.description, this.url});

  factory Cadeau.fromJson(Map<String, dynamic> json) {
    return Cadeau(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      url: json['url'],
    );
  }
}

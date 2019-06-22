import 'dart:convert';

class AddCadeauDto {
  // final File image;
  final String name;
  final int price;
  final String desc;
  final String link;
  final String picture;

  AddCadeauDto({this.name, this.price, this.desc, this.link, this.picture});

  Object toJson() {
    return json
        .encode({"link": link, "picture": '', "name": name, "price": price, "picture": picture});
  }
}

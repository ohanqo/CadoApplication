import 'dart:convert';

class AddCadeauDto {
  // final File image;
  final String name;
  final int price;
  final String desc;
  final String link;

  AddCadeauDto({this.name, this.price, this.desc, this.link});

  Object toJson() {
    return json
        .encode({"link": link, "picture": '', "name": name, "price": price});
  }
}

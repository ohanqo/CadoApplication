import 'dart:convert';
import 'dart:io';

class AddCadeauDto {
  final File image;
  final String name;
  final int price;
  final String desc;
  final String link;

  AddCadeauDto({this.image, this.name, this.price, this.desc, this.link});

  Object toJson() {
    return json
        .encode({"link": link, "picture": image, "name": name, "price": price});
  }
}

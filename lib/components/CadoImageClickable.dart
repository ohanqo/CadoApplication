import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadoImageClickable extends StatefulWidget {
  CadoImageClickable({Key key, this.changeImage, this.image}) : super(key: key);

  final void Function (File) changeImage;
  final File image;

  _CadoImageClickableState createState() => _CadoImageClickableState();
}

class _CadoImageClickableState extends State<CadoImageClickable> {
  File image;

  Future getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = image;
    });

    print(image);

    widget.changeImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 5.0,
              spreadRadius: 1.5,
              offset: Offset(0.5, 2.0))
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GestureDetector(
            onTap: getImage,
            child: image == null
                ? Image.network(
                    "https://picsum.photos/250?image=9",
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    image,
                    fit: BoxFit.cover,
                  ),
          )),
    );
  }
}

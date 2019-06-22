import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  RoundedTextField(
      {Key key,
      this.placeholder,
      this.textInputType = TextInputType.text,
      this.isTextObscur = false,
      this.validator,
      this.maxLines = 1,
      this.textEditingController})
      : super(key: key);

  final String placeholder;
  final TextInputType textInputType;
  final bool isTextObscur;
  final String Function(String) validator;
  final TextEditingController textEditingController;
  final int maxLines;

  @override
  RoundedTextFieldState createState() => RoundedTextFieldState();
}

class RoundedTextFieldState extends State<RoundedTextField> {
  FocusNode focusNode;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
    focusNode.addListener(handleFocus);
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  Future<Null> handleFocus() async {
    setState(() {
      isFocus = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      focusNode: focusNode,
      keyboardType: widget.textInputType,
      obscureText: widget.isTextObscur,
      validator: widget.validator,
      cursorColor: Colors.pink,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 16.0, color: isFocus ? Colors.pink : Colors.black),
          labelText: widget.placeholder,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
              borderRadius: BorderRadius.circular(12.0))),
    );
  }
}

import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final Size? size;
  final String? text;
  final Function? function;
  final TextStyle? textStyle;

  const CustomeButton({this.text, this.textStyle, this.size, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size!.height * .07,
        width: size!.width * .5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(143, 148, 251, 1),
              Color.fromRGBO(143, 148, 251, .6),
            ])),
        child: MaterialButton(
          onPressed: () {
            function!();
          },
          child: Center(
            child: Text(text!, style: textStyle),
          ),
        ));
  }
}

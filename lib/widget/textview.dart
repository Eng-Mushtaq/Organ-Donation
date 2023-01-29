import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';

class TextView extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final String? font;
  final Color? color;

  const TextView({
    Key? key,
    this.text,
    this.fontSize,
    this.font,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Text(
        text!,
        style: TextStyle(
            fontFamily: font,
            package: 'google_fonts_arabic',
            color: color,
            fontSize: fontSize ?? 16,
            height: .9),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // color: Color.fromARGB(255, 224, 223, 223),
      ),
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
    );
  }
}

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text, {Key? key, this.number}) : super(key: key);
  final String text;
  final bool? number;

  Color get color => number == true ? Colors.black.withOpacity(0.5) : Colors.white;
  double get size => number == true ? 14 : 16;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
    );
  }
}

import 'package:flutter/material.dart';

class Texts extends StatefulWidget {
  const Texts(this.text, this.size, this.color,this.textAlign, {super.key});

  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;



  @override
  State<Texts> createState() => _TextsState();
}

class _TextsState extends State<Texts> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
          fontSize: widget.size,
          fontFamily: 'MagicFlavour',
          color: widget.color,

        ),
    textAlign: widget.textAlign,
    );
  }
}

import 'package:flutter/material.dart';

class GroupButton extends StatefulWidget {
  const GroupButton(
      {required this.answerText, required this.onTapped, super.key});

  final String answerText;
  final void Function() onTapped;

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          minimumSize: const Size(150, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          widget.onTapped();
        },
        child: Text(widget.answerText));
  }
}

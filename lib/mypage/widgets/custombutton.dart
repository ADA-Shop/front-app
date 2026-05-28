import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final Widget page;

  const Custombutton({
    super.key,
    required this.text,
    required this.page,
});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}

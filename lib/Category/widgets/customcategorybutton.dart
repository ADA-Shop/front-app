import 'package:flutter/material.dart';

class Customcategorybutton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  const Customcategorybutton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,

        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

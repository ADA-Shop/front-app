import 'package:adaapp/Category/screens/Category_Page.dart';
import 'package:flutter/material.dart';

class Customcategorybutton extends StatelessWidget {
  final String text;

  const Customcategorybutton({
    super.key,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(initialCategory: text,),
          ),
        );
      },
      child: Container(
        width: 75,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

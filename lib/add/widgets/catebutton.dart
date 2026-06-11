import 'package:flutter/material.dart';

class Catebutton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const Catebutton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: selected ?
            Colors.blue.withOpacity(0.05) :
            Colors.white,

            border: selected ?
            Border.all(color: Colors.blue) :
            Border.all(color: Colors.black.withOpacity(0.05)),

            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
              text,
              style: TextStyle(
                color: selected ?
                Colors.blue :
                Colors.black,
              ),
              textAlign: TextAlign.center
          ),
        )
    );
  }
}

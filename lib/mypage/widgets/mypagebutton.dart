import 'package:flutter/material.dart';

class Mypagebutton extends StatelessWidget {

  final VoidCallback onTap;
  final Icon icon;
  final String text;

  const Mypagebutton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Colors.grey[200],),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    icon,
                    SizedBox(width: 5,),
                    Text(text)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}


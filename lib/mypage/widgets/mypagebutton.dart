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
    return Container(
      child: Column(
        children: [
          Divider(color: Colors.grey[200],),
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
    );
  }
}

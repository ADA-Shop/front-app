import 'package:flutter/material.dart';
class Customselectionbox extends StatelessWidget {
  final Widget child;

  const Customselectionbox({
    super.key,
    required this.child,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

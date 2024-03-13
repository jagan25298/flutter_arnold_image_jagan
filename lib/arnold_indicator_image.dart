import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 20 : 10,
      height: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.blueGrey,
          borderRadius: BorderRadius.circular(8.0)),
    );
  }
}

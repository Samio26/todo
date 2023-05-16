
import 'package:flutter/material.dart';

class Buttonnext extends StatelessWidget {
  const Buttonnext({required this.function});
final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function ,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
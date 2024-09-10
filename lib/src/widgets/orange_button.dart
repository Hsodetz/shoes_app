import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;

  const OrangeButton({super.key, 
  required this.title, 
  required this.width, 
  required this.height,
  this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(title, style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.w700),),
    );
  }
}
import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {

  final String title;
  final String description;

  const ShoeDescription({super.key, 
  this.title = "Nike Air Max 720", 
  this.description = "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(height: 20,),
          Text(description, style: const TextStyle(color: Colors.black54, height: 1.5),),
        
        ],
      ),
    );
  }
}
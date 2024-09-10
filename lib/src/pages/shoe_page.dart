import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ShoePage extends StatelessWidget {

  const ShoePage({super.key});

  @override
  Widget build(BuildContext context) {
  String description = "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.";

    return Scaffold(
      // body: CustomAppBar(text: 'For You!'),
      //body: ShoeSizePreview(),
      body: Column(
        children: [
          const CustomAppBar(text: 'For You!'),
          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Hero(
                    tag: 'shoe-1',
                    child: ShoeSizePreview(isFullScreen: false)
                  ),
                  
                  ShoeDescription(title: 'Nike Air Max 720', description: description),
            
                ],
              ),
            )
          ),

          const AddCartButton(amount: 180.0),
          
        ],
      )
      
    );
  }
}
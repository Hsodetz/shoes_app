import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class AddCartButton extends StatelessWidget {
  final double amount;

  const AddCartButton({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)
          ),

          child: Row(
            children: [
              const SizedBox(width: 20,),
              Text("\$${amount.toString()} ", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500,),),
              const Spacer(),
              const OrangeButton(title: 'Add to cart', width: 150, height: 50,),
              const SizedBox(width: 25,),


            ],
          ),
        ),
      ),
    );
  }
}
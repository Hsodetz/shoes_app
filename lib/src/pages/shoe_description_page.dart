import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/shoe_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';


class ShoeDescriptionpage extends StatelessWidget {
  const ShoeDescriptionpage({super.key});

  @override
  Widget build(BuildContext context) {
  String description = "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.";

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoe-1',
                child: ShoeSizePreview(isFullScreen: true)
              ),

              Positioned(
                top: 70,
                left: 5,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hoverElevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left, size: 60,),
                )
              )
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDescription(title: 'Nike Air Max 720', description: description),
                  const SizedBox(height: 30,),
                  const _ButtonPay(amount: 180,),
                  const _ColorsCircular(),
                  const SizedBox(height: 50,),

                  const _ButtonCartLikeSettings()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class _ButtonCartLikeSettings extends StatelessWidget {
  const _ButtonCartLikeSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        _ButtonCartLike(icon: Icons.apple_outlined, iconColor: Colors.red,),
        _ButtonCartLike(icon: Icons.shopping_cart,),
        _ButtonCartLike(icon: Icons.settings),

        
      ],
    );
  }
}

class _ButtonCartLike extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const _ButtonCartLike({
    super.key,
    required this.icon,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 15, offset: Offset(0, 5))
        ]
      ),
      child: Icon(icon, color: iconColor,),

    );
  }
}

class _ColorsCircular extends StatelessWidget {
  const _ColorsCircular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [

          const Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ColorCircle(color: Color(0xff364D56), index: 4, img: "assets/imgs/negro.png"),
                ),
                Positioned(
                  left: 60,
                  child: _ColorCircle(color: Color(0xff2099F1), index: 3, img: "assets/imgs/azul.png"),

                ),
                Positioned(
                  left: 30,
                  child: _ColorCircle(color: Color(0xffFFAD29), index: 2, img: "assets/imgs/amarillo.png"),
                ),
                _ColorCircle(color: Color(0xffC6D642), index: 1, img: "assets/imgs/verde.png"),

              ],
            )
          ),
    
          OrangeButton(title: 'More related items', width: 170, height: 30, color: Colors.orange.shade100,),
    
        ],
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final int index;
  final Color color;
  final String img;
  
  const _ColorCircle({
    super.key, required this.color, required this.index, required this.img,
  });

  @override
  Widget build(BuildContext context) {

    return FadeInLeft(
      delay: Duration(milliseconds: 100 * index),
      duration: const Duration(milliseconds: 400),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = img;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  final double amount;
  const _ButtonPay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Text("\$${amount.toString()} ", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500,),),
        const Spacer(),
        Bounce(
          from: 8,
          delay: const Duration(seconds: 1),
          child: const OrangeButton(title: 'Buy now', width: 120, height: 40,)
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
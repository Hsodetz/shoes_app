import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/shoe_model.dart';
import 'package:shoesapp/src/pages/shoe_description_page.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool isFullScreen;

  const ShoeSizePreview({super.key, required this.isFullScreen});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(!isFullScreen) {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const ShoeDescriptionpage(),));
        }
      },
      child: Padding(
        padding: !isFullScreen ? const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5) : const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
        child: Container(
          width: double.infinity,
          height: isFullScreen ? 385 : 410 ,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !isFullScreen 
                          ? BorderRadius.circular(60) 
                          : const BorderRadiusDirectional.vertical(top: Radius.circular(40) , bottom: Radius.circular(60))
          ),
          child: Column(
            children: [
              const _ShoeWithShadow(),
    
              if(!isFullScreen)
                const _ShoeTails(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(bottom: 10, right: 0, child: _ShoeShadow()),
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
            ]),
      ),
    );
  }
}

class _ShoeTails extends StatelessWidget {
  const _ShoeTails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _ShoeTail(
          tail: 7.0,
        ),
        _ShoeTail(
          tail: 7.5,
        ),
        _ShoeTail(
          tail: 8.0,
        ),
        _ShoeTail(
          tail: 8.5,
        ),
        _ShoeTail(
          tail: 9.0,
        ),
        _ShoeTail(
          tail: 9.5,
        ),
      ]),
    );
  }
}

class _ShoeTail extends StatelessWidget {
  final double tail;

  const _ShoeTail({super.key, required this.tail});

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.tail = tail;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: tail == shoeModel.tail ? const Color(0xffF1A23A) : Colors.white70, 
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if(tail == shoeModel.tail)
                const BoxShadow(color: Color(0xffF1A23A), blurRadius: 25, offset: Offset(0, 15)),
              
            ]
        ),
        child: Center(
          child: Text(
            tail.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: tail == shoeModel.tail?  Colors.white : const Color(0xffEAA14E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

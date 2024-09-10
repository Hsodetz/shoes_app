import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/shoe_model.dart';
import 'package:shoesapp/src/pages/shoe_page.dart';

void main() {

  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ShoeModel(),),
    ],
    child: const MyApp(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: Scaffold(
        body: ShoePage(),
        //body: ShoeDescriptionpage(),
      ),
    );
  }
}
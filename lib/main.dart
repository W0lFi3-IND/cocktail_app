import 'package:cocktail_app/homepage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());

}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData.dark(),
        home: HomePage(),
    );

  }

}
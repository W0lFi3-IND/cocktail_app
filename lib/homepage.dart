import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Cocktail App"),
          centerTitle:true,
          elevation: 0.0,
        ),
        body: Center(
          child:ListView.builder(
              itemCount: 50,
              itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Text("Item $index",style: TextStyle(
                  fontSize: 20
                ),)),
              );
              })
          ),

    );
  }
}

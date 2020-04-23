import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class DrinkDetail extends StatefulWidget{
  final drink;

   DrinkDetail({Key key,@required this.drink}) : super(key: key);

  @override
  _DrinkDetailState createState() => _DrinkDetailState();
}

class _DrinkDetailState extends State<DrinkDetail> {
var api = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=";
var res;
var drinksdetails;
@override
void initState() {
  super.initState();
  fetchData();
}

fetchData() async {
 var id = widget.drink["idDrink"];
 var Api = api+id;
 res = await http.get(Api);
 drinksdetails = jsonDecode(res.body)["drinks"];
  setState(() {

  });

}

@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink["strDrink"]),
        centerTitle: true,
      ),
      body:
      Center(
        child: res != null ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:20,bottom: 20),
              child: Container(
                alignment:Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage(drinksdetails[0]["strDrinkThumb"]),
                    radius: 100,),
                    Text(drinksdetails[0]["idDrink"]),
                  ],
                )
              ),
            ),
            Card(

            )
          ],
        ):CircularProgressIndicator(),
      )

    );
  }
}

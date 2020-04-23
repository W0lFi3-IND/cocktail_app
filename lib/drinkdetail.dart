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
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(),

                  child: Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Category : "+drinksdetails[0]['strAlcoholic'],style: TextStyle(
                            fontSize: 16,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Glass : "+drinksdetails[0]['strGlass'],style: TextStyle(
                            fontSize: 16,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 50,right: 30),
                          child:
                          Center(
                            child: Text("Ingredient :"+ drinksdetails[0]["strIngredient1"].toString()+",\n"+ drinksdetails[0]["strIngredient2"].toString()+","+ drinksdetails[0]["strIngredient3"].toString()+","
                                + drinksdetails[0]["strIngredient4"].toString()+","+ drinksdetails[0]["strIngredient5"].toString(),style: TextStyle(
                              fontSize: 16,
                            ),),
                          )
                          ,
                        ),

                  Padding(
                            padding: const EdgeInsets.only(top: 8,left: 50,right: 30),
                            child: Text("Instructions : "+drinksdetails[0]['strInstructions'],style: TextStyle(
                              fontSize: 16,
                            ),),
                          ),

                      ],
                    ),
                  ),
                ),
              ),
            )
              )

          ],
        ):CircularProgressIndicator(),
      )

    );
  }
}

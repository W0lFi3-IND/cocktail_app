import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res;
  Map drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail App"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: res != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return ListTile(
                    title:Text(
                      "${drink["strDrink"]}",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle:Text("${drink["idDrink"]}") ,
                    leading: CircleAvatar(backgroundImage: NetworkImage(drink["strDrinkThumb"]),),
                  );
                })
            : CircularProgressIndicator(),
      ),
    );
  }
}

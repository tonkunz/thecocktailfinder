import 'package:flutter/material.dart';
import 'package:thecocktailfinder/repositories/CocktailRepository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CocktailRepository repo = new CocktailRepository();

    return Scaffold(
      appBar: AppBar(
        title: Text("The Cocktail FInder"),
      ),
      body: Container(
        child: FutureBuilder(
            future: repo.getDrinksByFirstLetter(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("Snapshot data: ${snapshot.data[0].idDrink}");
                // print("teste ${snapshot.data.drinks}");

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctxt, index) {
                    return Text(snapshot.data[index].strDrink);
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

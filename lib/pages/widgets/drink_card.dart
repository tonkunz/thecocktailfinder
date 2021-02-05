import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'package:thecocktailfinder/pages/specific_drink_page.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;

  DrinkCard({
    @required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CocktailBloc>(context);

    return GestureDetector(
      onTap: () {
        _bloc.getDrinkDetailsById(drink.idDrink);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificDrinkPage(),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                this.drink.strDrinkThumb,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  this.drink.strDrink,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

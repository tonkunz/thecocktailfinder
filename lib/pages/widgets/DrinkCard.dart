import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/Drink.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;

  DrinkCard({
    @required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Card ${this.drink.idDrink} tapped");
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

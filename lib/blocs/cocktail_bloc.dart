import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'package:thecocktailfinder/repositories/cocktail_repository.dart';

class CocktailBloc extends ChangeNotifier {
  // Cliente Http
  final _cocktailRepo = CocktailRepository();

  // Lista de Drinks
  List<Drink> drinks = [];

  CocktailBloc() {
    print("CocktailBloc instanciado");

    getDrinksByFirstLetter();
  }

  getDrinksByFirstLetter() async {
    drinks = await _cocktailRepo.getDrinksByFirstLetter();
    notifyListeners();
  }
}

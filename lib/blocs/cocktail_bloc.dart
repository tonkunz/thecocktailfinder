import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'package:thecocktailfinder/repositories/cocktail_repository.dart';

class CocktailBloc extends ChangeNotifier {
  // Cliente Http
  final _cocktailRepo = CocktailRepository();

  // Lista de Drinks
  List<Drink> drinks = [];

  CocktailBloc() {
    getDrinksByFirstLetter();
  }

  getDrinksByFirstLetter() async {
    drinks = await _cocktailRepo.getDrinksByFirstLetter();
    notifyListeners();
  }

  filterDrinks(FilterSelected filter) {
    switch (filter.type) {
      case "c":
        // TODO: Fetch por categoria
        break;
      case "g":
        // TODO: Fetch por glass
        break;
      case "i":
        // TODO: Fetch por ingrediente
        break;
      case "a":
        // TODO: Fetch por teor alcoolico
        break;
      case "n":
        // TODO: Fetch por nome
        break;
      default:
        return drinks;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'package:thecocktailfinder/repositories/cocktail_repository.dart';

class CocktailBloc extends ChangeNotifier {
  // Cliente Http
  final _cocktailRepo = CocktailRepository();

  // Lista de Drinks
  List<Drink> drinks = [];

  // Drink Specific Details
  Drink drinkDetails = Drink();

  CocktailBloc() {
    getDrinksByFirstLetter();
  }

  // Método utilizado ao entrar no App, alimentando a lista inicial
  getDrinksByFirstLetter() async {
    drinks = await _cocktailRepo.getDrinksByFirstLetter();
    notifyListeners();
  }

  // Método "roteador", ou seja, que direciona para o endpoint
  // correto baseado no filtro escolhido pelo usuário
  filterDrinks(FilterSelected filter) async {
    switch (filter.type) {
      case "c":
      case "g":
      case "i":
      case "a":
        drinks = await _cocktailRepo.filterDrinks(filter);
        notifyListeners();
        break;
      case "n":
        drinks = await _cocktailRepo.getDrinksByName(filter.param);
        notifyListeners();
        break;
      default:
        return drinks;
    }
  }

  getDrinkDetailsById(String id) async {
    drinkDetails = await _cocktailRepo.getDrinkById(id);
    notifyListeners();
  }

  clearDrinkDetails() {
    drinkDetails = Drink();
    notifyListeners();
  }
}

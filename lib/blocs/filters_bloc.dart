import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/repositories/filters_repository.dart';

class FiltersBloc extends ChangeNotifier {
  final _filtersRepo = new FiltersRepository();

  // Filtro por grau de álcool
  final List<String> alcoholic = [
    "Alcoholic",
    "Non alcoholic",
    "Optional alcohol"
  ];

  // Categorias e Getter p/ Categorias
  List<CategoryFilter> _categories = [];

  UnmodifiableListView<CategoryFilter> get categories =>
      UnmodifiableListView(_categories);

  // Glasses e Getter p/ Glasses
  List<GlassFilter> _glasses = [];

  UnmodifiableListView<GlassFilter> get glasses =>
      UnmodifiableListView(_glasses);

  // Glasses e Getter p/ Ingredients
  List<IngredientFilter> _ingredients = [];

  UnmodifiableListView<IngredientFilter> get ingredients =>
      UnmodifiableListView(_ingredients);

  FiltersBloc() {
    print("FiltersBloc mounted");
    getCategories();
    getGlasses();
    getIngredients();
  }

  getCategories() async {
    _categories = await _filtersRepo.getFilters("c");
    notifyListeners();
  }

  getGlasses() async {
    _glasses = await _filtersRepo.getFilters("g");
    notifyListeners();
  }

  getIngredients() async {
    _ingredients = await _filtersRepo.getFilters("i");
    notifyListeners();
  }
}

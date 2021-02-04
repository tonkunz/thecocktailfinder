import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'package:thecocktailfinder/repositories/filters_repository.dart';

class FiltersBloc extends ChangeNotifier {
  // Cliente Http
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

  // Prop e Getter p/ filtro selectionado
  FilterSelected _filterSelected = new FilterSelected();

  FilterSelected get selectedFilter => _filterSelected;

  FiltersBloc() {
    getCategories();
    getGlasses();
    getIngredients();
  }

  // Fetch de todas as categorais da API
  getCategories() async {
    _categories = await _filtersRepo.getFilters("c");
    _categories.insert(0, CategoryFilter(strCategory: "Escolha uma Categoria"));
    notifyListeners();
  }

  // Fetch de todos os tipos de copos da API
  getGlasses() async {
    _glasses = await _filtersRepo.getFilters("g");
    _glasses.insert(0, GlassFilter(strGlass: "Selecione o tipo de Copo"));
    notifyListeners();
  }

  // Fetch de todos os ingredientes da API
  getIngredients() async {
    _ingredients = await _filtersRepo.getFilters("i");
    _ingredients.insert(
      0,
      IngredientFilter(strIngredient1: "Selecione um Ingrediente"),
    );
    notifyListeners();
  }

  // Seta qual o filtro selecionado pelo usuário
  void setFilterSelected(FilterSelected value) {
    _filterSelected = value;
    notifyListeners();
  }
}

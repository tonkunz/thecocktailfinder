import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/models/filter_option.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'package:thecocktailfinder/repositories/filters_repository.dart';

class FiltersBloc extends ChangeNotifier {
  // Cliente Http
  final _filtersRepo = FiltersRepository();

  // Tipos de Filtros possíveis
  final List<FilterType> filtros = [
    FilterType(text: "Escolha um Filtro", type: ""),
    FilterType(text: "Filtrar por Nome", type: "n"),
    FilterType(text: "Filtrar por teor Alcoólico", type: "a"),
    FilterType(text: "Filtrar por Categoria", type: "c"),
    FilterType(text: "Filtrar por Tipo do Copo", type: "g"),
    FilterType(text: "Filtrar por Ingrediente", type: "i")
  ];

  // Filtro por grau de álcool
  final List<String> alcoholic = [
    "Selecione o teor Alcoólico",
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
  FilterSelected _filterSelected = new FilterSelected(param: "", type: "");

  FilterSelected get selectedFilter => _filterSelected;

  FiltersBloc() {
    getCategories();
    getGlasses();
    getIngredients();
  }

  // Fetch de todas as categorais da API
  getCategories() async {
    _categories = await _filtersRepo.getFilters("c");
    _categories.insert(
        0, CategoryFilter(strCategory: "Selecione uma Categoria"));
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

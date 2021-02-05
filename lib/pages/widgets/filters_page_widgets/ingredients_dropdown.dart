import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';

class IngredientDropdown extends StatefulWidget {
  @override
  _IngredientDropdownState createState() => _IngredientDropdownState();
}

class _IngredientDropdownState extends State<IngredientDropdown> {
  IngredientFilter _ingredientSelected;

  @override
  void initState() {
    super.initState();

    final _ingredients = context.read<FiltersBloc>().ingredients;

    // Pega o valor de selectedFilter no BloC de Filters
    FilterSelected isSelectedFilter =
        context.read<FiltersBloc>().selectedFilter;

    if (isSelectedFilter.param != "") {
      _ingredientSelected = _ingredients
          .firstWhere((el) => el.strIngredient1 == isSelectedFilter.param);
    } else {
      _ingredientSelected = _ingredients[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: _ingredientSelected,
        icon: Icon(Icons.arrow_downward),
        onChanged: (IngredientFilter value) {
          setState(() => _ingredientSelected = value);

          // Seta qual o filtro selecionado no BloC
          _bloc.setFilterSelected(
            FilterSelected(
              param: value.strIngredient1.contains("Selecione")
                  ? ""
                  : value.strIngredient1,
              type: "i",
            ),
          );
        },
        items: _bloc.ingredients.map((IngredientFilter ing) {
          return DropdownMenuItem(
            value: ing,
            child: Text(ing.strIngredient1),
          );
        }).toList(),
      ),
    );
    ;
  }
}

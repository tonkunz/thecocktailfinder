import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';

class CategoryDropdown extends StatefulWidget {
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  CategoryFilter _categorySelected;

  @override
  void initState() {
    super.initState();
    _categorySelected = context.read<FiltersBloc>().categories[0];
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: _categorySelected,
        icon: Icon(Icons.arrow_downward),
        onChanged: (CategoryFilter value) {
          setState(() => _categorySelected = value);

          // Seta qual o filtro selecionado no BloC
          _bloc.setFilterSelected(
            FilterSelected(param: value.strCategory, type: "c"),
          );
        },
        items: _bloc.categories.map((CategoryFilter cat) {
          return DropdownMenuItem(
            value: cat,
            child: Text(cat.strCategory),
          );
        }).toList(),
      ),
    );
  }
}

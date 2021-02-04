import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';

class GlassDropdown extends StatefulWidget {
  @override
  _GlassDropdownState createState() => _GlassDropdownState();
}

class _GlassDropdownState extends State<GlassDropdown> {
  GlassFilter _glassSelected;

  @override
  void initState() {
    super.initState();
    _glassSelected = context.read<FiltersBloc>().glasses[0];
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: _glassSelected,
        icon: Icon(Icons.arrow_downward),
        onChanged: (GlassFilter value) {
          setState(() => _glassSelected = value);

          // Seta qual o filtro selecionado no BloC
          _bloc.setFilterSelected(
            FilterSelected(
              param: value.strGlass.contains("Selecione") ? "" : value.strGlass,
              type: "g",
            ),
          );
        },
        items: _bloc.glasses.map((GlassFilter glass) {
          return DropdownMenuItem(
            value: glass,
            child: Text(glass.strGlass),
          );
        }).toList(),
      ),
    );
  }
}

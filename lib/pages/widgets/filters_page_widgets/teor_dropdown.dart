import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';

class TeorDropdown extends StatefulWidget {
  @override
  _TeorDropdownState createState() => _TeorDropdownState();
}

class _TeorDropdownState extends State<TeorDropdown> {
  String _teorSelected = "Selecione o teor Alcoólico";

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        value: _teorSelected,
        icon: Icon(Icons.arrow_downward),
        onChanged: (String value) {
          setState(() => _teorSelected = value);

          // Seta o filtro selecionado no BloC
          _bloc.setFilterSelected(FilterSelected(param: value, type: "a"));
        },
        items: _bloc.alcoholic.map((String alc) {
          return DropdownMenuItem(
            value: alc,
            child: Text(alc),
          );
        }).toList(),
      ),
    );
  }
}

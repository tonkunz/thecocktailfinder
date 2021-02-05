import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';

class NameDrinkInput extends StatefulWidget {
  @override
  _NameDrinkInputState createState() => _NameDrinkInputState();
}

class _NameDrinkInputState extends State<NameDrinkInput> {
  TextEditingController _nameCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();

    FilterSelected isSelectedFilter =
        context.read<FiltersBloc>().selectedFilter;

    if (isSelectedFilter.param != "") {
      _nameCtrl.text = isSelectedFilter.param;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: _nameCtrl,
        onChanged: (String value) {
          _bloc.setFilterSelected(
            FilterSelected(param: value, type: "n"),
          );
        },
        decoration: InputDecoration(
          labelText: "Entre com o nome do Drink",
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';
import 'package:thecocktailfinder/models/filter_option.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/category_dropdown.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/glass_dropdown.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/ingredients_dropdown.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  FilterType _tipoSelecionado;

  final List<FilterType> _filtros = [
    FilterType(text: "Escolha um Filtro", type: ""),
    FilterType(text: "Filtrar por Nome", type: "nome"),
    FilterType(text: "Filtrar por teor Alcoólico", type: "teor"),
    FilterType(text: "Filtrar por Categoria", type: "categoria"),
    FilterType(text: "Filtrar por Tipo do Copo", type: "copo"),
    FilterType(text: "Filtrar por Ingrediente", type: "ingrediente"),
  ];

  @override
  void initState() {
    super.initState();
    this._tipoSelecionado = this._filtros[0];
  }

  Widget handleDropdown(BuildContext context, FiltersBloc bloc) {
    switch (_tipoSelecionado.type) {
      case "categoria":
        return bloc.categories.length != 0
            ? CategoryDropdown()
            : Text("Carregando Categorias...");
      case "copo":
        return bloc.glasses.length != 0
            ? GlassDropdown()
            : Text("Carregando Tipos de Copos...");
      case "ingrediente":
        return bloc.ingredients.length != 0
            ? IngredientDropdown()
            : Text("Carregando ingredientes...");
      default:
        return Text("Escolha um Tipo de Filtro");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<FiltersBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Drinks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField(
              value: this._tipoSelecionado,
              icon: Icon(Icons.arrow_downward),
              onChanged: (FilterType value) {
                setState(() => _tipoSelecionado = value);
              },
              items: this._filtros.map((FilterType filtro) {
                return DropdownMenuItem(
                  value: filtro,
                  child: Text(filtro.text),
                );
              }).toList(),
            ),
          ),
          handleDropdown(context, _bloc),
        ],
      ),
    );
  }
}

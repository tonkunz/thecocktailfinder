import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/models/filter_option.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'package:thecocktailfinder/pages/shared/custom_button.dart';

// Dropdown Widgets
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/category_dropdown.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/glass_dropdown.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/ingredients_dropdown.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/namedrink_input.dart';
import 'package:thecocktailfinder/pages/widgets/filters_page_widgets/teor_dropdown.dart';

// BloC
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';

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

  // Método que retorna qual o Widget ideal baseado no FilterType
  Widget handleDropdown(BuildContext context, FiltersBloc bloc) {
    switch (_tipoSelecionado.type) {
      case "nome":
        return NameDrinkInput();
      case "teor":
        return TeorDropdown();
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
        return Text(
          "Nenhum filtro escolhido",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _filtersBloc = Provider.of<FiltersBloc>(context);
    final _cocktailBloc = Provider.of<CocktailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Drinks'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _filtersBloc.setFilterSelected(FilterSelected(type: "", param: ""));
            Navigator.pop(context);
          },
        ),
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
                // Reseta o parâmetro selecionado assim que muda o tipo do parâmetro
                _filtersBloc
                    .setFilterSelected(FilterSelected(param: "", type: ""));
              },
              items: this._filtros.map((FilterType filtro) {
                return DropdownMenuItem(
                  value: filtro,
                  child: Text(filtro.text),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 15),
          handleDropdown(context, _filtersBloc),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomButton(
              btnText: "BUSCAR",
              fnc: () {
                _cocktailBloc.filterDrinks(_filtersBloc.selectedFilter);
                Navigator.pop(context, "Filtrando Drinks...");
              },
              icon: Icons.search,
              isDisabled:
                  _filtersBloc.selectedFilter.param == "" ? true : false,
            ),
          ),
        ],
      ),
    );
  }
}

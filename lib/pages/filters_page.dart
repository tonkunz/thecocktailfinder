import 'package:flutter/material.dart';
import 'package:thecocktailfinder/models/filter_option.dart';
import 'package:thecocktailfinder/repositories/filters_repository.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  FilterType _tipoSelecionado;

  final List<FilterType> _filtros = [
    new FilterType(text: "Escolha um Filtro", type: ""),
    new FilterType(text: "Filtrar por Nome", type: "nome"),
    new FilterType(text: "Filtrar por teor Alcoólico", type: "teor"),
    new FilterType(text: "Filtrar por Categoria", type: "categoria"),
    new FilterType(text: "Filtrar por Tipo do Copo", type: "copo"),
    new FilterType(text: "Filtrar por Ingrediente", type: "ingrediente"),
  ];

  @override
  void initState() {
    super.initState();
    this._tipoSelecionado = this._filtros[0];
  }

  @override
  Widget build(BuildContext context) {
    FiltersRepository _repo = new FiltersRepository();

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
              onChanged: (FilterType newValue) {
                setState(() => _tipoSelecionado = newValue);
              },
              items: this._filtros.map((FilterType filtro) {
                return new DropdownMenuItem(
                  value: filtro,
                  child: Text(filtro.text),
                );
              }).toList(),
            ),
          ),

          //Teste
          FutureBuilder(
            future: _repo.getFilters('c'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("Data: ${snapshot.data.categories[0].strCategory}");
              } else {
                return Text("Loading...");
              }
            },
          )
        ],
      ),
    );
  }
}

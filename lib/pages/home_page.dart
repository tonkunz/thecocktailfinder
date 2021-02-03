import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thecocktailfinder/pages/filters_page.dart';
import 'package:thecocktailfinder/repositories/cocktail_repository.dart';
import 'widgets/drink_card.dart';

class HomePage extends StatelessWidget {
  final String logo = 'assets/logo.svg';

  _navigateToFiltersPage(BuildContext context) async {
    // TODO: Pegar o resultado da consulta ao fechar página de filtros
    final String result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersPage(),
      ),
    );

    print("Result $result");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Modal Fechado'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CocktailRepository _repo = new CocktailRepository();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        flexibleSpace: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: SvgPicture.asset(logo, height: 55),
          ),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder(
            future: _repo.getDrinksByFirstLetter(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data.length, (index) {
                    return DrinkCard(drink: snapshot.data[index]);
                  }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Filtrar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () => this._navigateToFiltersPage(context),
      ),
    );
  }
}

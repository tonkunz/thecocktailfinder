import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/pages/filters_page.dart';
import 'widgets/drink_card.dart';

class HomePage extends StatelessWidget {
  final String logo = 'assets/logo.svg';

  dynamic _navigateToFiltersPage(BuildContext context) async {
    final String result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersPage(),
      ),
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CocktailBloc>(context);

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
        child: _bloc.drinks.length != 0
            ? GridView.count(
                crossAxisCount: 2,
                children: List.generate(_bloc.drinks.length, (index) {
                  return DrinkCard(drink: _bloc.drinks[index]);
                }),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/pages/filters_page.dart';
import 'package:thecocktailfinder/pages/widgets/home_page_widgets/no_results.dart';
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

  Widget _handleBodyContent(BuildContext context, CocktailBloc bloc) {
    if (bloc.drinks.length != 0) {
      if (bloc.drinks[0].strDrink == "Sem resultados.")
        return NoResultsOnSearch();

      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(bloc.drinks.length, (index) {
          return DrinkCard(drink: bloc.drinks[index]);
        }),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CocktailBloc>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            flexibleSpace: Container(
              padding: EdgeInsets.only(top: 10),
              child: SvgPicture.asset(logo, height: 60),
            ),
          ),
        ),
      ),
      body: _handleBodyContent(context, _bloc),
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

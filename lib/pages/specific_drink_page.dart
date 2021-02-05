import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/pages/widgets/specific_drink_page/drink_content.dart';

class SpecificDrinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<CocktailBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Drink"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _bloc.clearDrinkDetails();
            Navigator.pop(context);
          },
        ),
      ),
      body: _bloc.drinkDetails.strDrink == null
          ? Center(child: CircularProgressIndicator())
          : DrinkContent(drink: _bloc.drinkDetails),
    );
  }
}

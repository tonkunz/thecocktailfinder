import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'ingredients_table.dart';

class DrinkContent extends StatelessWidget {
  final Drink drink;
  final String blender = 'assets/icons/blender.svg';

  DrinkContent({
    @required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Imagem do Drink
          Image.network(
            drink.strDrinkThumb,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 15),
          // Nome do Drink
          Text(
            drink.strDrink,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          // Barra contento a categoria e o teor alcoólico
          Container(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(drink.strCategory, style: categoryAlcoholicStyles),
                Text(drink.strAlcoholic, style: categoryAlcoholicStyles),
              ],
            ),
          ),
          SizedBox(height: 15),
          // Sessão de Ingredientes e Tabela de Ingredientes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list_alt_rounded),
              SizedBox(width: 5),
              Text("Ingredientes e Medidas", style: sectionTitleStyle),
            ],
          ),
          SizedBox(height: 15),
          IngredientsTable(drink: drink),
          SizedBox(height: 15),
          // Sesão preparo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(blender, height: 24),
              SizedBox(width: 5),
              Text("Preparo", style: sectionTitleStyle),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(drink.strInstructions),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  // Variáveis de estilos (P/ evita repetiçẽos excessivas)
  final categoryAlcoholicStyles = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  final sectionTitleStyle = TextStyle(fontSize: 20);
}

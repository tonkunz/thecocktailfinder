import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'ingredients_table.dart';
import 'rate_drink.dart';

class DrinkContent extends StatelessWidget {
  final Drink drink;
  final String blender = 'assets/icons/blender.svg';

  DrinkContent({
    @required this.drink,
  });

  Widget _paddingText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Text(text),
    );
  }

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
          // Barra contento a categoria e o teor alcoólico
          Container(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(drink.strCategory, style: categoryAlcoholicStyles),
                Text(drink.strAlcoholic, style: categoryAlcoholicStyles),
              ],
            ),
          ),
          // Sessão de Ingredientes e Tabela de Ingredientes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list_alt_rounded),
              SizedBox(width: 5),
              Text("Ingredientes e Medidas", style: sectionTitleStyle),
            ],
          ),
          IngredientsTable(drink: drink),
          // Sesão preparo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(blender, height: 24),
              SizedBox(width: 5),
              Text("Preparo", style: sectionTitleStyle),
            ],
          ),
          _paddingText(drink.strInstructions),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_emotions_rounded),
              SizedBox(width: 5),
              Text("E aí, Curtiu?", style: sectionTitleStyle),
            ],
          ),
          _paddingText(
              "Por favor, deixe uma nota para este Drink. Obs: Sua nota ainda não será computada, pois trata-se apenas de uma simulação"),
          RateDrink(),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  // Variáveis de estilos p/ evita repetições excessivas
  final categoryAlcoholicStyles = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  final sectionTitleStyle = TextStyle(fontSize: 20);
}

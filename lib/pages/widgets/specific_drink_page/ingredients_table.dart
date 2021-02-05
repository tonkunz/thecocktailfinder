import 'package:flutter/material.dart';
import 'package:thecocktailfinder/helpers/ingredient_helper.dart';
import 'package:thecocktailfinder/models/drink.dart';

class IngredientsTable extends StatelessWidget {
  final Drink drink;

  // Infelizmente, por limitaçõesd a API, os ingredientes e medidas estão
  // "espalhados" pelo objeto Drink, precisando assim, ser passado por completo
  // para este widget filho
  IngredientsTable({
    @required this.drink,
  });

  List<TableRow> _handleIngredientsQuantidade() {
    List<IngredientMeasure> ingredientList = handleIngredients(drink);

    // Itera por um array fornecido pelo Helper, criando as linhas da Tabela
    List<TableRow> rows = ingredientList.map((IngredientMeasure ing) {
      return TableRow(
        children: [
          _tableCell(ing.ingredient),
          _tableCell(ing.measure),
        ],
      );
    }).toList();

    // Insere o cabeçalho da tabela
    rows.insert(
      0,
      TableRow(
        children: [
          Center(
            child: Container(
              child: Text("Ingrediente", style: titleCell),
            ),
          ),
          Center(
            child: Container(
              child: Text("Medida", style: titleCell),
            ),
          ),
        ],
      ),
    );

    return rows;
  }

  Widget _tableCell(String content) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(3),
      child: Text(content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Table(
        children: _handleIngredientsQuantidade(),
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.black26),
          verticalInside: BorderSide(color: Colors.black26),
        ),
      ),
    );
  }

  // Estilos
  final TextStyle titleCell = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}

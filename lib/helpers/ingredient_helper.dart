import 'package:thecocktailfinder/models/drink.dart';

// Devido a api não tratar bem a relação Ingrediente/Medida
// um helper deve ser criado para auxiliar os widgets a consumirem
// tal informação (como montar a tabela, por exemplo).
List<IngredientMeasure> handleIngredients(Drink drink) {
  List<IngredientMeasure> ingredients = [];

  // Converte para um Map, para facilitar a iteração
  var mapDrink = drink.toJson();

  for (var i = 0; i < 15; i++) {
    IngredientMeasure ingredientMeasure =
        IngredientMeasure(ingredient: "", measure: "");

    if (mapDrink["strIngredient${i + 1}"] != null) {
      ingredientMeasure.ingredient = mapDrink["strIngredient${i + 1}"];
    }

    if (mapDrink["strMeasure${i + 1}"] != null) {
      ingredientMeasure.measure = mapDrink["strMeasure${i + 1}"];
    }

    if ((mapDrink["strIngredient${i + 1}"] != null) ||
        (mapDrink["strMeasure${i + 1}"] != null)) {
      ingredients.add(ingredientMeasure);
    }
  }
  return ingredients;
}

class IngredientMeasure {
  String ingredient;
  String measure;

  IngredientMeasure({this.ingredient, this.measure});
}

class ApiFilters {
  List<CategoryFilter> categories = [];
  List<GlassFilter> glasses = [];
  List<IngredientFilter> ingredients = [];
  static List<String> alcoholic = [
    "Alcoholic",
    "Non alcoholic",
    "Optional alcohol",
  ];

  ApiFilters.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      final drinks = json['drinks'];

      // Verifica o tipo do filtro
      if (drinks[0]['strCategory'] != null) {
        drinks.forEach((v) {
          categories.add(new CategoryFilter.fromJson(v));
        });
      }

      if (drinks[0]['strGlass'] != null) {
        drinks.forEach((v) {
          glasses.add(new GlassFilter.fromJson(v));
        });
      }

      if (drinks[0]['strIngredient1'] != null) {
        drinks.forEach((v) {
          ingredients.add(new IngredientFilter.fromJson(v));
        });
      }
    }
  }
}

class CategoryFilter {
  String strCategory;

  CategoryFilter.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }
}

class GlassFilter {
  String strGlass;

  GlassFilter.fromJson(Map<String, dynamic> json) {
    strGlass = json['strGlass'];
  }
}

class IngredientFilter {
  String strIngredient1;

  IngredientFilter.fromJson(Map<String, dynamic> json) {
    strIngredient1 = json['strIngredient1'];
  }
}

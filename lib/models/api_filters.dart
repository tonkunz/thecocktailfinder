class CategoryFilter {
  String strCategory;

  CategoryFilter({this.strCategory});

  CategoryFilter.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }
}

class GlassFilter {
  String strGlass;

  GlassFilter({this.strGlass});

  GlassFilter.fromJson(Map<String, dynamic> json) {
    strGlass = json['strGlass'];
  }
}

class IngredientFilter {
  String strIngredient1;

  IngredientFilter({this.strIngredient1});

  IngredientFilter.fromJson(Map<String, dynamic> json) {
    strIngredient1 = json['strIngredient1'];
  }
}

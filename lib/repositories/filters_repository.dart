import 'package:dio/dio.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'custom_dio.dart';

class FiltersRepository {
  final Dio dio = getDio();

  Future<dynamic> getFilters(String filter) async {
    Response response = await dio.get("/list.php?$filter=list");

    // Faz o parse do Json baseado em qual filtro foi requerido
    switch (filter) {
      case 'c':
        return (response.data['drinks'] as List)
            .map((cat) => CategoryFilter.fromJson(cat))
            .toList();

      case 'g':
        return (response.data['drinks'] as List)
            .map((glass) => GlassFilter.fromJson(glass))
            .toList();

      case 'i':
        return (response.data['drinks'] as List)
            .map((ing) => IngredientFilter.fromJson(ing))
            .toList();
    }
  }
}

import 'package:dio/dio.dart';
import 'package:thecocktailfinder/models/drink.dart';
import 'package:thecocktailfinder/models/filter_selected.dart';
import 'custom_dio.dart';

class CocktailRepository {
  final Dio dio = getDio();

  // Método usado para fetch inicial dos Drinks
  Future<List<Drink>> getDrinksByFirstLetter() async {
    Response response = await dio.get("/search.php?f=a");

    return handleResponse(response);
  }

  Future<List<Drink>> getDrinksByName(String name) async {
    Response response = await dio.get("/search.php?s=$name");

    return handleResponse(response);
  }

  Future<List<Drink>> filterDrinks(FilterSelected filter) async {
    Response response =
        await dio.get("/filter.php?${filter.type}=${filter.param}");

    return handleResponse(response);
  }

  Future<Drink> getDrinkById(String id) async {
    Response response = await dio.get("/lookup.php?i=$id");

    return Drink.fromJson(response.data['drinks'][0]);
  }

  // Helper
  List<Drink> handleResponse(Response res) {
    if (res.data['drinks'] != null)
      return (res.data['drinks'] as List)
          .map((drink) => Drink.fromJson(drink))
          .toList();
    else
      return [];
  }
}

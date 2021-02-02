import 'package:dio/dio.dart';
import 'package:thecocktailfinder/models/Drink.dart';
import 'CustomDio.dart';

class CocktailRepository {
  final Dio dio = getDio();

  Future<List<Drink>> getDrinksByFirstLetter() async {
    Response response = await dio.get("/search.php?f=a");

    return (response.data['drinks'] as List)
        .map((drink) => Drink.fromJson(drink))
        .toList();
  }
}

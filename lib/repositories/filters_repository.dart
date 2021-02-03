import 'package:dio/dio.dart';
import 'package:thecocktailfinder/models/api_filters.dart';
import 'custom_dio.dart';

class FiltersRepository {
  final Dio dio = getDio();

  Future<ApiFilters> getFilters(String filter) async {
    Response response = await dio.get("/list.php?$filter=list");

    return ApiFilters.fromJson(response.data);
  }
}

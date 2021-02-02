import 'package:dio/dio.dart';

Dio getDio() {
  BaseOptions options =
      new BaseOptions(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1");

  Dio dio = new Dio(options);

  return dio;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:thecocktailfinder/pages/home_page.dart';

// BloC's
import 'package:thecocktailfinder/blocs/cocktail_bloc.dart';
import 'package:thecocktailfinder/blocs/filters_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<CocktailBloc>(create: (_) => CocktailBloc()),
        ListenableProvider<FiltersBloc>(create: (_) => FiltersBloc()),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff583d72),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xff583d72),
    ));

    return MaterialApp(
      title: 'The Cocktail Finder',
      debugShowCheckedModeBanner: false,
      // Tema da aplicação, pode futuramente ir para um arquivo separado
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        primaryColor: Color(0xff583d72),
        accentColor: Color(0xffff8e71),
      ),
      home: HomePage(),
    );
  }
}

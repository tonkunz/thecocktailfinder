import 'package:flutter/material.dart';
import 'package:thecocktailfinder/pages/widgets/DrinkCard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thecocktailfinder/repositories/CocktailRepository.dart';

class HomePage extends StatelessWidget {
  final String logo = 'assets/logo.svg';

  @override
  Widget build(BuildContext context) {
    CocktailRepository repo = new CocktailRepository();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: 40),
          child: SvgPicture.asset(logo, height: 55),
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder(
            future: repo.getDrinksByFirstLetter(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data.length, (index) {
                    return DrinkCard(drink: snapshot.data[index]);
                  }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

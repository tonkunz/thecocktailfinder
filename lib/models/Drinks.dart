import 'Drink.dart';

class Drinks {
  List<Drink> drinks;

  Drinks({this.drinks});

  Drinks.fromJson(Map<String, dynamic> json) {
    print("Drinks from JSON triggered");

    if (json['drinks'] != null) {
      print("conversion started");
      List<Drink> drinks = [];

      json['drinks'].forEach((v) {
        drinks.add(new Drink.fromJson(v));
      });
      print("Drinks now $drinks");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

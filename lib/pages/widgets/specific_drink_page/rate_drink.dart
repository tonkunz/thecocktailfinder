import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 45,
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        half: Icon(
          Icons.star_half_rounded,
          color: Colors.amber,
        ),
        empty: Icon(
          Icons.star_outline_rounded,
          color: Colors.amber,
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

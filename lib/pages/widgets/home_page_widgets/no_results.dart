import 'package:flutter/material.dart';

class NoResultsOnSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(
              Icons.error_outline_outlined,
              size: 100,
              color: Colors.red[600],
            ),
            Text(
              "Ops...",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "Não foram encontrados Drinks com o nome informado...",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

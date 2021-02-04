import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function fnc;
  final IconData icon;
  final bool isDisabled;

  CustomButton({
    @required this.btnText,
    @required this.fnc,
    @required this.icon,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: isDisabled ? () {} : fnc,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: isDisabled ? Colors.black26 : Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(
              btnText,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

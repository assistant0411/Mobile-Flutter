import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.colour1, @required this.colour2, this.cardChild});

  final Color colour1;
  final Color colour2;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.00),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF3A3A3A),
            blurRadius: 3.0, // has the effect of softening the shadow
            spreadRadius: 0.00, // has the effect of extending the shadow
            offset: Offset(
              3.0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            //TODO: para trocar o fundo dos cards para gradiente, trocar o segundo "colour 1" para "colour 2"
            colour1,
            colour1,
          ],
        ),
        borderRadius: BorderRadius.circular(15.00),
      ),
    );
  }
}

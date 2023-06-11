import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label, this.sizeText});

  final IconData icon;
  final String label;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70.0,
          color: kBranco,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sizeText,
            color: kBranco,
            fontFamily: 'OpenSansCondensedBold',
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

/* @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70.0,
          color: kActiveCardColor5,
        ),
        SizedBox(
          height: 40,
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: kActiveCardColor5,
            ),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: sizeText,
                    color: kActiveCardColor3,
                    fontFamily: 'OpenSansBold',
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}*/

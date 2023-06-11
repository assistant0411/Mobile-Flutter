import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Dashboard',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 25.0,
                color: kVermelhoBase,
                fontFamily: 'Oswald',
              ),
            ),
            Image(
              image: AssetImage('images/mercantis.png'),
              height: 36,
              width: 36.0,
            ),
          ],
        ),
      ),
      body: Text(''),
    );
  }
}

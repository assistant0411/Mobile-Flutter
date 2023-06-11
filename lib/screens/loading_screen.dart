import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercantis_flutter/screens/cliente_screen.dart';
import 'package:mercantis_flutter/screens/favoritos_screen.dart';
import 'package:mercantis_flutter/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getClienteData();
  }

  void getClienteData() async {
    NetworkHelper networkHelper = NetworkHelper(
        "http://api-mobile.tanis.com.br/api/mobile/v10/Clientes/Lista/Simples?CNPJ=00085822000112&CodUsuario=75");
    var clientesData = await networkHelper.getData();
    Navigator.pushNamed(context, '/favoritos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTES'),
      ),
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFFB91D21),
          size: 100.0,
        ),
      ),
    );
  }
}

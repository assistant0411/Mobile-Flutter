import 'package:flutter/material.dart';
import 'package:mercantis_flutter/screens/loading_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cliente_screen.dart';
import 'screens/cnpj_screen.dart';
import 'screens/login_screen.dart';
import 'screens/compras_screen.dart';
import 'screens/vendas_screen.dart';
import 'screens/suporte_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/favoritos_screen.dart';
import 'screens/cliente_detalhe_screen.dart';
import 'package:flutter/services.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFB91D21),
        accentColor: Color(0xFFB91D21),
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/cliente': (context) => ClienteScreen(),
        '/cnpj': (context) => CnpjScreen(),
        '/login': (context) => LoginScreen(),
        '/compras': (context) => ComprasScreen(),
        '/vendas': (context) => VendasScreen(),
        '/suporte': (context) => SuporteScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/favoritos': (context) => FavoritosScreen(),
        '/loading': (context) => LoadingScreen(),
        '/detalhe': (context) => ClienteDetalheScreen(),
      },
    );
  }
}

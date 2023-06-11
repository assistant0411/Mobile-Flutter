import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/screens/cliente_detalhe_screen.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:mercantis_flutter/services/clientes_simple_service.dart';
import 'package:mercantis_flutter/models/lista_favorito.dart';

class FavoritosScreen extends StatefulWidget {
  FavoritosScreen() : super();

  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  // https://jsonplaceholder.typicode.com/users

  final _debouncer = Debouncer(milliseconds: 500);
  int count = 0;
  String title;
  bool isLoading;
  bool isFavorite = false;
  List<FavoritoSimples> users = List<FavoritoSimples>();
  List<FavoritoSimples> filteredUsers = List<FavoritoSimples>();

  @override
  void initState() {
    isLoading = true;
    super.initState();
    title = 'Carregando...';
    Services.getFav().then((usersFromServer) {
      setState(() {
        print(usersFromServer);
        users = usersFromServer;
        filteredUsers = users;
        title = 'Clientes Favoritos';
        isLoading = false;
      });
    });
  }

  Widget indicator() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: Color(0xFFE8E8E8),
        title: Text(
          "Carregando...",
          style: TextStyle(
            fontSize: 20.0,
            color: kVermelhoBase,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFFB91D21),
          size: 100.0,
        ),
      ),
    );
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.showData();
    }
  }

  Widget showData() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: Color(0xFFE8E8E8),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            color: kVermelhoBase,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText:
                  'Procurar em ${filteredUsers.length} clientes encontrados',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredUsers = users
                      .where((u) => (u.fantasia
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.cnpj.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: filteredUsers == null ? 0 : filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ClienteDetalheScreen(
                            codCliente: filteredUsers[index].cliente,
                          );
                        }));
                      },
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                          border: new Border(
                            right:
                                new BorderSide(width: 1.0, color: kCinzaEscuro),
                          ),
                        ),
                        child: Icon(Icons.star, color: kCinzaEscuro),
                      ),
                      title: Text(
                        filteredUsers[index].fantasia,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: kCinzaEscuro,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: kVermelhoBase),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'CNPJ: ${filteredUsers[index].cnpj.toLowerCase()}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: kVermelhoBase, size: 30.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeBody();
  }
}

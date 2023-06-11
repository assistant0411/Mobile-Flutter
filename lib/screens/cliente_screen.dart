import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mercantis_flutter/models/lista_favorito.dart';
import 'package:mercantis_flutter/screens/vendas_screen.dart';
import 'package:mercantis_flutter/services/clientes_simple_service.dart';
import 'package:mercantis_flutter/models/lista_simples.dart';
import 'cliente_detalhe_screen.dart';

class ClienteScreen extends StatefulWidget {
  ClienteScreen() : super();

  final String title = "Clientes";

  @override
  _ClienteScreenState createState() => _ClienteScreenState();
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

class _ClienteScreenState extends State<ClienteScreen> {
  // https://jsonplaceholder.typicode.com/user

  final _debouncer = Debouncer(milliseconds: 500);
  bool isLoading;
  bool isSearch;
  String titulo;
  List<ClienteSimples> users = List<ClienteSimples>();
  List<ClienteSimples> filteredUsers = List<ClienteSimples>();
  List<FavoritoSimples> favoritos = List<FavoritoSimples>();

  @override
  void initState() {
    isSearch = false;
    isLoading = true;
    super.initState();
    titulo = 'Carregando...';
    Services.getFav().then((usersFromServer) {
      setState(() {
        print(usersFromServer);
        favoritos = usersFromServer;
        titulo = 'Clientes';
        isLoading = false;
      });
    });
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.showData();
    }
  }

  Widget makeCol() {
    if (isSearch) {
      return this.searchlist();
    } else {
      return this.noList();
    }
  }

  Widget indicator() {
    return Scaffold(
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
              titulo,
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
      body: Center(
        child: SpinKitCubeGrid(
          color: Color(0xFFB91D21),
          size: 100.0,
        ),
      ),
    );
  }

  Widget searchlist() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        itemCount: filteredUsers == null ? 0 : filteredUsers.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2.0,
            margin: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ClienteDetalheScreen(
                      codCliente: filteredUsers[index].cliente,
                    );
                  }));
                },
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                    border: new Border(
                      right: new BorderSide(width: 1.0, color: kCinzaEscuro),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.star_border,
                      size: 30,
                      color: Colors.amber,
                    ),
                    onPressed: () =>
                        //TODO: favoritar
                        Navigator.pushNamed(context, '/dashboard'),
                  ),
                ),
                title: Text(
                  filteredUsers[index].fantasia,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
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
                    color: kVermelhoBase, size: 40.0),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget noList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "FAVORITOS",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
                color: kVermelhoBase),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            itemCount: favoritos == null ? 0 : favoritos.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 2.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFE8E8E8)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ClienteDetalheScreen(
                          codCliente: favoritos[index].cliente,
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
                      child: IconButton(
                        icon: Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.amber,
                        ),
                        onPressed: () =>
                            //TODO: favoritar
                            Navigator.pushNamed(context, '/dashboard'),
                      ),
                    ),
                    title: Text(
                      favoritos[index].fantasia,
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
                          'CNPJ: ${favoritos[index].cnpj.toLowerCase()}',
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
        ],
      ),
    );
  }

  StatefulWidget showData() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
//        centerTitle: true,
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              titulo,
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
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: "Pesquisar em todos os Cliente...",
            ),
            onChanged: (string) {
              isLoading = true;
              _debouncer.run(() {
                Services.getFilterUsers(string).then((usersFromServer) {
                  setState(() {
                    users = usersFromServer;
                    filteredUsers = users;
                    isLoading = false;
                    isSearch = true;
                  });
                });
              });
            },
          ),
          makeCol(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return makeBody();
  }
}

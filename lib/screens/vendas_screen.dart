import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/models/lista_vendas_model.dart';
import 'package:mercantis_flutter/screens/venda_detalhe_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:mercantis_flutter/services/lista_vendas_service.dart';

class VendasScreen extends StatefulWidget {
  VendasScreen() : super();

  @override
  _VendasScreenState createState() => _VendasScreenState();
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

class _VendasScreenState extends State<VendasScreen> {
  final _debouncer = Debouncer(milliseconds: 500);
  int count = 0;
  String title;
  bool isLoading;
  bool isFavorite = false;
  List<Iten> vendas = List<Iten>();
  List<Iten> filteredVendas = List<Iten>();
  final formatCurrency = NumberFormat("###,##0.00", "pt_BR");

  @override
  void initState() {
    isLoading = true;
    super.initState();
    title = 'Carregando...';
    Services.getVendas().then((usersFromServer) {
      setState(() {
        vendas = usersFromServer;
        filteredVendas = vendas;
        title = 'Vendas Não Liberadas';
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
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Carregando...',
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
          color: kVermelhoBase,
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
    //TODO: pull to refresh
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
              title,
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
//          TextField(
//            decoration: InputDecoration(
//              contentPadding: EdgeInsets.all(15.0),
//              hintText: "Procurar Venda...",
//            ),
//            onChanged: (string) {
//              isLoading = true;
//              _debouncer.run(() {
//                filteredVendas = vendas
//                    .where((u) => (u.fantasia
//                            .toLowerCase()
//                            .contains(string.toLowerCase()) ||
//                        u.razaoSocial
//                            .toLowerCase()
//                            .contains(string.toLowerCase())))
//                    .toList();
//              });
//            },
//          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredVendas == null ? 0 : filteredVendas.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VendaDetalheScreen(
                        pedido: filteredVendas[index].pedido,
                      );
                    }));
                  },
                  child: Card(
                    elevation: 4.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 6.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: kBranco,
                          borderRadius: BorderRadius.circular(15.00),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    flex: 8,
                                    child: Container(
                                      padding: EdgeInsets.only(right: 12.0),
                                      decoration: new BoxDecoration(
                                        border: new Border(
                                          right: new BorderSide(
                                              width: 2.0, color: kCinzaEscuro),
                                        ),
                                      ),
                                      child: Icon(Icons.monetization_on,
                                          color: kCinzaEscuro),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 84,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            filteredVendas[index].razaoSocial,
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
//                                          Text(
//                                            filteredVendas[index].esFantasia,
//                                            style: TextStyle(
//                                                fontSize: 12.0,
//                                                color: kCinzaEscuro,
//                                                fontWeight: FontWeight.w400),
//                                            textAlign: TextAlign.center,
//                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  "Pedido: ${filteredVendas[index].pedido.toString()} |",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kCinzaSubtitulo,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "Emissão: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(filteredVendas[index].data.toString().substring(0, 10)))}",
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kCinzaSubtitulo,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: Icon(Icons.keyboard_arrow_right,
                                        color: kVermelhoBase, size: 40.0),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Total:",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: kVermelhoBase,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "R\$${formatCurrency.format(filteredVendas[index].valorAFaturar)}",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: kCinzaEscuro,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "OpenSans-Regular"),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
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

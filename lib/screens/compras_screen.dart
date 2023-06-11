import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/models/lista_compras.dart';
import 'package:mercantis_flutter/screens/compra_detalhe_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:mercantis_flutter/services/lista_compras_service.dart';

class ComprasScreen extends StatefulWidget {
  ComprasScreen() : super();

  @override
  _ComprasScreenState createState() => _ComprasScreenState();
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

class _ComprasScreenState extends State<ComprasScreen> {
  final _debouncer = Debouncer(milliseconds: 500);
  int count = 0;
  String title;
  final formatCurrency = new NumberFormat("###,##0.00", "pt_BR");
  bool isLoading;
  bool isFavorite = false;
  List<Compras> compras = List<Compras>();
  List<Compras> filteredCompras = List<Compras>();

  @override
  void initState() {
    isLoading = true;
    super.initState();
    title = 'Carregando...';
    Services.getCompras().then((usersFromServer) {
      setState(() {
        compras = usersFromServer;
        filteredCompras = compras;
        title = 'Compras Não Autorizadas';
        isLoading = false;
      });
    });
  }

  Widget indicator() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoGradiente, //change your color here
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
      //TODO: Criar botao para ordernar lislta (de forma alfabetica e cronologica)
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
//              hintText: "Procurar Compra...",
//            ),
//            onChanged: (string) {
//              _debouncer.run(() {
//                setState(() {
//                  filteredCompras = compras
//                      .where((u) => (u.fornecedorFantasia
//                              .toLowerCase()
//                              .contains(string.toLowerCase()) ||
//                          u.compradorNome
//                              .toLowerCase()
//                              .contains(string.toLowerCase())))
//                      .toList();
//                });
//              });
//            },
//          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredCompras == null ? 0 : filteredCompras.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CompraDetalheScreen(
                        pedido: filteredCompras[index].pedido,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                      child: Icon(Icons.person,
                                          color: kCinzaEscuro),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 84,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            filteredCompras[index]
                                                .fornecedorFantasia,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Pedido: ${filteredCompras[index].pedido.toString()} |  ",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: kCinzaSubtitulo,
                                                ),
                                                overflow: TextOverflow.clip,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 0,
                                              ),
                                              Text(
                                                "Emissão: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(filteredCompras[index].emissao.toString().substring(0, 10)))}",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: kCinzaSubtitulo,
                                                ),
                                                overflow: TextOverflow.clip,
                                                textAlign: TextAlign.center,
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
                                        "R\$${formatCurrency.format(filteredCompras[index].totalPedido)}",
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

// ESTILO ALTERNATIVO

//import 'package:flutter/material.dart';
//import 'package:mercantis_flutter/constants.dart';
//import 'package:mercantis_flutter/models/lista_compras.dart';
//import 'package:mercantis_flutter/screens/compra_detalhe_screen.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:mercantis_flutter/constants.dart';
//import 'package:intl/intl.dart';
//import 'dart:convert';
//import 'dart:async';
//import 'package:mercantis_flutter/services/lista_compras_service.dart';
//
//class ComprasScreen extends StatefulWidget {
//  ComprasScreen() : super();
//
//  @override
//  _ComprasScreenState createState() => _ComprasScreenState();
//}
//
//class Debouncer {
//  final int milliseconds;
//  VoidCallback action;
//  Timer _timer;
//
//  Debouncer({this.milliseconds});
//
//  run(VoidCallback action) {
//    if (null != _timer) {
//      _timer.cancel();
//    }
//    _timer = Timer(Duration(milliseconds: milliseconds), action);
//  }
//}
//
//class _ComprasScreenState extends State<ComprasScreen> {
//  final _debouncer = Debouncer(milliseconds: 500);
//  int count = 0;
//  String title;
//  final formatCurrency = new NumberFormat("###,##0.00", "pt_BR");
//  bool isLoading;
//  bool isFavorite = false;
//  List<Compras> compras = List<Compras>();
//  List<Compras> filteredCompras = List<Compras>();
//
//  @override
//  void initState() {
//    isLoading = true;
//    super.initState();
//    title = 'Carregando...';
//    Services.getCompras().then((usersFromServer) {
//      setState(() {
//        compras = usersFromServer;
//        filteredCompras = compras;
//        title = 'Compras Não Autorizadas';
//        isLoading = false;
//      });
//    });
//  }
//
//  Widget indicator() {
//    return Scaffold(
//      backgroundColor: kBranco,
//      //TODO: Criar botao para ordernar lislta (de forma alfabetica e cronologica)
//      body: Column(
//        children: <Widget>[
//          SafeArea(
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                      boxShadow: [
//                        BoxShadow(
//                          color: kCinzaSubtitulo,
//                          blurRadius:
//                              2.0, // has the effect of softening the shadow
//                          spreadRadius:
//                              1.00, // has the effect of extending the shadow
//                          offset: Offset(
//                            1.0, // horizontal, move right 10
//                            1.0, // vertical, move down 10
//                          ),
//                        )
//                      ],
//                      shape: BoxShape.circle,
//                    ),
//                    child: CircleAvatar(
//                      child: IconButton(
//                        icon: Icon(
//                          Icons.arrow_back,
//                          size: 30,
//                          color: kBranco,
//                        ),
//                        onPressed: () => Navigator.pop(context),
//                      ),
//                      backgroundColor: kVermelhoBase,
//                      radius: 25.0,
//                    ),
//                  ),
//                  Row(
//                    textBaseline: TextBaseline.ideographic,
//                    crossAxisAlignment: CrossAxisAlignment.baseline,
//                    children: <Widget>[
//                      Text(
//                        "Carregando...",
//                        textAlign: TextAlign.end,
//                        overflow: TextOverflow.clip,
//                        style: TextStyle(
//                          fontSize: 23.0,
//                          fontWeight: FontWeight.w500,
//                          color: kCinzaEscuro,
//                          fontFamily: 'Oswald',
//                        ),
//                      ),
//                      SizedBox(
//                        width: 5,
//                      ),
//                      Image(
//                        image: AssetImage('images/mercantis.png'),
//                        height: 36,
//                        width: 36.0,
//                      ),
//                      SizedBox(
//                        width: 5,
//                      ),
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ),
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: kCinzaSubtitulo,
//                      blurRadius: 3.0, // has the effect of softening the shadow
//                      spreadRadius:
//                          1.00, // has the effect of extending the shadow
//                      offset: Offset(
//                        0.0, // horizontal, move right 10
//                        -1.0, // vertical, move down 10
//                      ),
//                    )
//                  ],
//                  color: kCinzaClaroAzulado,
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(30.0),
//                      topRight: Radius.circular(30.0))),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Center(
//                  child: SpinKitCubeGrid(
//                    color: Color(0xFFB91D21),
//                    size: 100.0,
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget makeBody() {
//    if (isLoading) {
//      return this.indicator();
//    } else {
//      return this.showData();
//    }
//  }
//
//  Widget showData() {
//    return Scaffold(
//      backgroundColor: kBranco,
//      //TODO: Criar botao para ordernar lislta (de forma alfabetica e cronologica)
////      appBar: AppBar(
////        iconTheme: IconThemeData(
////          color: kVermelhoBase, //change your color here
////        ),
////        elevation: 5.0,
////        backgroundColor: kBranco,
////        title: Row(
////          mainAxisAlignment: MainAxisAlignment.spaceBetween,
////          children: <Widget>[
////            Text(
////              title,
////              overflow: TextOverflow.clip,
////              style: TextStyle(
////                fontSize: 25.0,
////                color: kVermelhoBase,
////                fontFamily: 'Oswald',
////              ),
////            ),
////            Image(
////              image: AssetImage('images/mercantis.png'),
////              height: 36,
////              width: 36.0,
////            ),
////          ],
////        ),
////      ),
//      body: Column(
//        children: <Widget>[
//          SafeArea(
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                      boxShadow: [
//                        BoxShadow(
//                          color: kCinzaSubtitulo,
//                          blurRadius:
//                              2.0, // has the effect of softening the shadow
//                          spreadRadius:
//                              1.00, // has the effect of extending the shadow
//                          offset: Offset(
//                            1.0, // horizontal, move right 10
//                            1.0, // vertical, move down 10
//                          ),
//                        )
//                      ],
//                      shape: BoxShape.circle,
//                    ),
//                    child: CircleAvatar(
//                      child: IconButton(
//                        icon: Icon(
//                          Icons.arrow_back,
//                          size: 30,
//                          color: kBranco,
//                        ),
//                        onPressed: () => Navigator.pop(context),
//                      ),
//                      backgroundColor: kVermelhoBase,
//                      radius: 25.0,
//                    ),
//                  ),
//                  Row(
//                    textBaseline: TextBaseline.ideographic,
//                    crossAxisAlignment: CrossAxisAlignment.baseline,
//                    children: <Widget>[
//                      Text(
//                        title,
//                        textAlign: TextAlign.end,
//                        overflow: TextOverflow.clip,
//                        style: TextStyle(
//                          fontSize: 23.0,
//                          fontWeight: FontWeight.w500,
//                          color: kCinzaEscuro,
//                          fontFamily: 'Oswald',
//                        ),
//                      ),
//                      SizedBox(
//                        width: 5,
//                      ),
//                      Image(
//                        image: AssetImage('images/mercantis.png'),
//                        height: 36,
//                        width: 36.0,
//                      ),
//                      SizedBox(
//                        width: 5,
//                      ),
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ),
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                  boxShadow: [
//                    BoxShadow(
//                      color: kCinzaSubtitulo,
//                      blurRadius: 3.0, // has the effect of softening the shadow
//                      spreadRadius:
//                          1.00, // has the effect of extending the shadow
//                      offset: Offset(
//                        0.0, // horizontal, move right 10
//                        -1.0, // vertical, move down 10
//                      ),
//                    )
//                  ],
//                  color: kCinzaClaroAzulado,
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(30.0),
//                      topRight: Radius.circular(30.0))),
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Column(
//                  children: <Widget>[
////          TextField(
////            decoration: InputDecoration(
////              contentPadding: EdgeInsets.all(15.0),
////              hintText: "Procurar Compra...",
////            ),
////            onChanged: (string) {
////              _debouncer.run(() {
////                setState(() {
////                  filteredCompras = compras
////                      .where((u) => (u.fornecedorFantasia
////                              .toLowerCase()
////                              .contains(string.toLowerCase()) ||
////                          u.compradorNome
////                              .toLowerCase()
////                              .contains(string.toLowerCase())))
////                      .toList();
////                });
////              });
////            },
////          ),
//                    Expanded(
//                      child: ListView.builder(
//                        padding: EdgeInsets.all(10.0),
//                        itemCount: filteredCompras == null
//                            ? 0
//                            : filteredCompras.length,
//                        itemBuilder: (BuildContext context, int index) {
//                          //return makeCard;
//                          return GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                return CompraDetalheScreen(
//                                  pedido: filteredCompras[index].pedido,
//                                );
//                              }));
//                            },
//                            child: Card(
//                              elevation: 4.0,
//                              margin: new EdgeInsets.symmetric(
//                                  horizontal: 2.0, vertical: 6.0),
//                              child: Container(
//                                  decoration: BoxDecoration(
//                                    color: kBranco,
//                                    borderRadius: BorderRadius.circular(20.00),
//                                  ),
//                                  child: Column(
//                                    children: <Widget>[
//                                      Padding(
//                                        padding: const EdgeInsets.all(8.0),
//                                        child: Row(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.start,
//                                          children: <Widget>[
//                                            Flexible(
//                                              flex: 8,
//                                              child: Container(
//                                                padding: EdgeInsets.only(
//                                                    right: 12.0),
//                                                decoration: new BoxDecoration(
//                                                  border: new Border(
//                                                    right: new BorderSide(
//                                                        width: 2.0,
//                                                        color: kCinzaEscuro),
//                                                  ),
//                                                ),
//                                                child: Icon(Icons.person,
//                                                    color: kCinzaEscuro),
//                                              ),
//                                            ),
//                                            Flexible(
//                                              flex: 84,
//                                              child: Padding(
//                                                padding:
//                                                    const EdgeInsets.all(8.0),
//                                                child: Column(
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Text(
//                                                      filteredCompras[index]
//                                                          .fornecedorFantasia,
//                                                      style: TextStyle(
//                                                          fontSize: 18.0,
//                                                          color: Colors.black,
//                                                          fontWeight:
//                                                              FontWeight.w500),
//                                                      overflow:
//                                                          TextOverflow.clip,
//                                                      textAlign:
//                                                          TextAlign.center,
//                                                    ),
//                                                    Row(
//                                                      mainAxisAlignment:
//                                                          MainAxisAlignment
//                                                              .center,
//                                                      crossAxisAlignment:
//                                                          CrossAxisAlignment
//                                                              .center,
//                                                      children: <Widget>[
//                                                        Text(
//                                                          "Pedido: ${filteredCompras[index].pedido.toString()} |  ",
//                                                          style: TextStyle(
//                                                            fontSize: 14.0,
//                                                            color:
//                                                                kCinzaSubtitulo,
//                                                          ),
//                                                          overflow:
//                                                              TextOverflow.clip,
//                                                          textAlign:
//                                                              TextAlign.center,
//                                                        ),
//                                                        SizedBox(
//                                                          width: 0,
//                                                        ),
//                                                        Text(
//                                                          "Emissão: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(filteredCompras[index].emissao.toString().substring(0, 10)))}",
//                                                          style: TextStyle(
//                                                            fontSize: 14.0,
//                                                            color:
//                                                                kCinzaSubtitulo,
//                                                          ),
//                                                          overflow:
//                                                              TextOverflow.clip,
//                                                          textAlign:
//                                                              TextAlign.center,
//                                                        ),
//                                                      ],
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                            Flexible(
//                                              flex: 8,
//                                              child: Icon(
//                                                  Icons.keyboard_arrow_right,
//                                                  color: kVermelhoBase,
//                                                  size: 40.0),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                      Divider(),
//                                      Padding(
//                                        padding: const EdgeInsets.all(10.0),
//                                        child: Column(
//                                          children: <Widget>[
//                                            Row(
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment
//                                                      .spaceBetween,
//                                              children: <Widget>[
//                                                Text(
//                                                  "Total:",
//                                                  style: TextStyle(
//                                                    fontSize: 16.0,
//                                                    color: kVermelhoBase,
//                                                    fontWeight: FontWeight.w500,
//                                                  ),
//                                                  overflow:
//                                                      TextOverflow.ellipsis,
//                                                ),
//                                                Text(
//                                                  "R\$${formatCurrency.format(filteredCompras[index].totalPedido)}",
//                                                  style: TextStyle(
//                                                      fontSize: 14.0,
//                                                      color: kCinzaEscuro,
//                                                      fontWeight:
//                                                          FontWeight.w500,
//                                                      fontFamily:
//                                                          "OpenSans-Regular"),
//                                                  overflow:
//                                                      TextOverflow.ellipsis,
//                                                ),
//                                              ],
//                                            ),
//                                            SizedBox(
//                                              height: 5,
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  )),
//                            ),
//                          );
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return makeBody();
//  }
//}
//

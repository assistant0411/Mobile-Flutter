import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercantis_flutter/widgets/reusable_card.dart';
import 'package:mercantis_flutter/widgets/icon_content.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void onTabTapped() {
    _scaffoldKey.currentState.openDrawer(); // CHANGE THIS LINE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBranco,
//      appBar: PreferredSize(
//        preferredSize: Size(double.infinity, 70),
//        child: AppBar(
//          iconTheme:
//              new IconThemeData(color: kVermelhoBase, opacity: 1, size: 40),
//          elevation: 0.0,
//          backgroundColor: kBranco, //kActiveBackgroundBar
//          title: Center(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Text(
//                  'Mercantis Mobile',
//                  style: TextStyle(
//                    fontSize: 30.0,
//                    color: kVermelhoBase,
//                    fontFamily: 'Oswald',
//                  ),
//                ),
//                SizedBox(
//                  width: 10,
//                ),
//                Image(
//                  image: AssetImage('images/mercantis.png'),
//                  height: 39.0,
//                  width: 39.0,
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kCinzaSubtitulo,
                          blurRadius:
                              2.0, // has the effect of softening the shadow
                          spreadRadius:
                              1.00, // has the effect of extending the shadow
                          offset: Offset(
                            1.0, // horizontal, move right 10
                            1.0, // vertical, move down 10
                          ),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.list,
                          size: 30,
                          color: kBranco,
                        ),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                      backgroundColor: kVermelhoBase,
                      radius: 30.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        textBaseline: TextBaseline.ideographic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            'Mercantis',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                              color: kVermelhoBase,
                              fontFamily: 'Oswald',
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            'Mobile',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: kCinzaEscuro,
                              fontFamily: 'Oswald',
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kCinzaSubtitulo,
                      blurRadius: 3.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.00, // has the effect of extending the shadow
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        -1.0, // vertical, move down 10
                      ),
                    )
                  ],
                  color: kCinzaClaroAzulado,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              //TODO: fazer animação de clique
                              onTap: () {
//                                Navigator.pushNamed(context, '/cliente');
                                Navigator.pushNamed(context, '/cliente');
                              },
                              child: ReusableCard(
                                colour1: Color(0xFFFFFFFF),
                                colour2: Color(0xFFFFFFFF),
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.person_outline,
                                      size: 70.0,
                                      color: Color(0xFF3A3A3A),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'CLIENTES',
                                      style: TextStyle(
                                        //TODO: mudar as fontes do app
                                        fontSize: 15.0,
                                        color: Color(0xFF3A3A3A),
                                        fontFamily: 'OpenSansCondensedBold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/dashboard');
                              },
                              child: ReusableCard(
                                colour1: kVermelhoBase,
                                colour2: kVermelhoBase,
                                cardChild: IconContent(
                                  icon: Icons.dashboard,
                                  label: 'DASHBOARD',
                                  sizeText: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/vendas');
                              },
                              child: ReusableCard(
                                colour1: kVermelhoBase,
                                colour2: kVermelhoBase,
                                cardChild: IconContent(
                                  icon: Icons.assignment_turned_in,
                                  label: 'LIBERAR VENDAS',
                                  sizeText: 15.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/compras');
                              },
                              child: ReusableCard(
                                colour1: kVermelhoBase,
                                colour2: kVermelhoBase,
                                cardChild: IconContent(
                                  icon: Icons.attach_money,
                                  label: 'AUTORIZAR COMPRAS',
                                  sizeText: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: ReusableCard(
                                colour1: kVermelhoBase,
                                colour2: kVermelhoBase,
                                cardChild: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image(
                                    image: AssetImage('images/mercantis.png'),
                                    height: 500.0,
                                    width: 50.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/suporte');
                              },
                              child: ReusableCard(
                                colour1: Color(0xFFFFFFFF),
                                colour2: Color(0xFFFFFFFF),
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.people_outline,
                                      size: 70.0,
                                      color: Color(0xFF3A3A3A),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'SUPORTE',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xFF3A3A3A),
                                        fontFamily: 'OpenSansCondensedBold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Desenvolvido por ©TanisTecnologia",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kCinzaSubtitulo, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 30,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/logotanis.png'),
                      height: 150.0,
                      width: 150.0,
                    ),
//                    Text(
//                      'Mercantis Mobile',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                        fontSize: 25.0,
//                        color: kVermelhoBase,
//                        fontFamily: 'BebasNeue',
//                      ),
//                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: kBranco,
                ),
              ),
            ),
            Expanded(
              flex: 60,
              //TODO: tirar o padding entre o icone e o titulo
              //TODO: mudar IconSize
              //https://inducesmile.com/google-flutter/how-to-change-the-drawer-hamburger-icon-color-in-flutter/
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      'Clientes',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/cliente');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.assignment_turned_in),
                    title: Text(
                      'Liberar Vendas',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/vendas');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      'Autorizar Compras',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/compras');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.people_outline),
                    title: Row(
                      children: <Widget>[
                        Text(
                          'Suporte',
                          style: TextStyle(
                            fontSize: 17.0,
                            color: kCinzaEscuro,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/suporte');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                // This align moves the children to the bottom
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        //ListTile(
                        // leading: Icon(Icons.settings),
                        //title: Text('Configurações'),
                        //onTap: () {
                        // Navigator.pushNamed(context, '/suporte');
                        // },
                        //),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text(
                            'Sair',
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/cnpj');
                          },
                        ),
                        Divider(),
                        Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            child: Text(
                              "V1.0.0",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

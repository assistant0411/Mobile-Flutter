import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/screens/consulta_venda_screen.dart';
import 'package:mercantis_flutter/screens/venda_detalhe_screen.dart';
import 'package:mercantis_flutter/services/clientes_detalhe_service.dart';
import 'package:mercantis_flutter/models/clientes_detalhe.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:mercantis_flutter/widgets/row_detail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class ClienteDetalheScreen extends StatefulWidget {
  ClienteDetalheScreen({this.codCliente});
  final codCliente;

  @override
  _ClienteDetalheScreenState createState() => _ClienteDetalheScreenState();
}

class _ClienteDetalheScreenState extends State<ClienteDetalheScreen>
    with SingleTickerProviderStateMixin {
  int cod = 0;
  int _selectedIndex = 0;
  bool isLoading;

  bool _isVisible = true;
  bool _isVisible2 = true;
  bool _isVisible3 = true;

  List<Endereco> endereco = List<Endereco>();
  List<Contato> contato = List<Contato>();
  List<Pedido> pedido = List<Pedido>();
  List<ResumoCr> resumo = List<ResumoCr>();
  String fantasia;
  String status;
  String nome;
  String cnpj;
  String fj;
  String telefone;
  dynamic classificacao;
  dynamic inscricaoEstadual;
  dynamic inscricaoMunicipal;
  dynamic tipo;
  dynamic setor;
  String dsSetor;
  DateTime dtCadastro;
  DateTime dtAtualizacao;
  dynamic cnpjOk;
  dynamic tipoCliente;
  dynamic indicadorIE;

  TabController _tabController;
  final formatCurrency = NumberFormat("###,##0.00", "pt_BR");

  @override
  void initState() {
    isLoading = true;
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    cod = widget.codCliente;
    Services.getCliente(cod).then((usersFromServer) {
      setState(() {
        print(usersFromServer);
        telefone = usersFromServer.telefone;
        endereco = usersFromServer.enderecos;
        contato = usersFromServer.contatos;
        pedido = usersFromServer.pedidos;
        resumo = usersFromServer.resumoCr;

        nome = usersFromServer.nome;
        fantasia = usersFromServer.fantasia;
        status = usersFromServer.status;
        cnpj = usersFromServer.cnpj;
        fj = usersFromServer.fj;
        classificacao = usersFromServer.classificacao;
        inscricaoEstadual = usersFromServer.inscricaoEstadual;
        inscricaoMunicipal = usersFromServer.inscricaoMunicipal;
        tipo = usersFromServer.tipo;
        setor = usersFromServer.setor;
        dsSetor = usersFromServer.dsSetor;
        dtCadastro = usersFromServer.dtCadastro;
        dtAtualizacao = usersFromServer.dtAtualizacao;
        cnpjOk = usersFromServer.cnpjOk;
        tipoCliente = usersFromServer.tipoCliente;
        indicadorIE = usersFromServer.indicadorIe;

        isLoading = false;
      });
    });
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.Tabi();
    }
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

  Widget Tabi() {
    return new Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoBase, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '$fantasia',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 15.0,
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
        bottom: TabBar(
          unselectedLabelColor: kCinzaEscuro,
          labelColor: kVermelhoBase,
          tabs: [
            Tab(
              icon: new Icon(Icons.person),
              text: "Cliente",
            ),
            Tab(
              icon: new Icon(Icons.local_grocery_store),
              text: "Pedidos",
            ),
            Tab(
              icon: new Icon(Icons.library_books),
              text: "CR",
            ),
          ],
          controller: _tabController,
          indicatorColor: kVermelhoBase,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          BodyWidget(),
          produt(),
          cr(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget BodyWidget() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          compras_detalhe_widget(
                              texto1: 'Fantasia',
                              texto2: '${fantasia.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'CNPJ', texto2: '${cnpj.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Telefone', texto2: telefone),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Setor', texto2: '${dsSetor.toString()}'),
//                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Rentabilidade',
//                              texto2:
//                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(data.toString().substring(0, 10)))}'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListView.builder(
                            physics: new NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(5.0),
                            shrinkWrap: true,
                            itemCount: endereco == null ? 0 : endereco.length,
                            itemBuilder: (BuildContext context, int index) {
                              //return makeCard;
                              return RowDetail(
                                icone: Icons.home,
                                texto1:
                                    '${endereco[index].endereco.toString().toString()}, ${endereco[index].bairro.toString()}, ${endereco[index].cep.toString()}',
                                texto2: 'Endereço',
                                corIcone: kVermelhoBase,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kVermelhoBase,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    size: 25,
                                    color: kVermelhoBase,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Contatos',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'OpenSans',
                                      color: kVermelhoBase,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            expanded: ListView.builder(
                              //TODO: adicionar segundo telefone
                              physics: new NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.all(5.0),
                              shrinkWrap: true,
                              itemCount: contato == null ? 0 : contato.length,
                              itemBuilder: (BuildContext context, int index) {
                                //return makeCard;
                                return Card(
                                  elevation: 4.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 5.0),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Color(0xFFE8E8E8)),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Nome",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(width: 10),
                                              Flexible(
                                                child: Text(
                                                  '${contato[index].nome.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'OpenSans',
                                                      color: kCinzaEscuro),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Cargo',
                                            texto2:
                                                '${contato[index].cargo.toString()}'),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Telefone',
                                            texto2:
                                                '(${contato[index].prefixo1.toString()}) ${contato[index].numero1.toString()}'),
                                        Divider(),
                                        compras_detalhe_widget(
                                            texto1: 'Email',
                                            texto2: contato[index].email),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              ButtonTheme(
                                                minWidth: 5,
                                                child: FlatButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Discar",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color:
                                                                kVermelhoBase,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Icon(
                                                        Icons.phone_in_talk,
                                                        color: kVermelhoBase,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    launch("tel:" +
                                                        '${contato[index].prefixo1.toString().toString()}${contato[index].numero1.toString()}');
                                                  },
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 12.0),
                                                decoration: new BoxDecoration(
                                                  border: new Border(
                                                    right: new BorderSide(
                                                        width: 1.0,
                                                        color: kCinzaEscuro),
                                                  ),
                                                ),
                                              ),
                                              ButtonTheme(
                                                minWidth: 5,
                                                child: FlatButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "Enviar Email",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'OpenSans',
                                                            color:
                                                                kVermelhoBase,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Icon(
                                                        Icons.mail_outline,
                                                        color: kVermelhoBase,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    launch("mailto:" +
                                                        '${contato[index].email.toString()}');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget produt() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: pedido == null ? 0 : pedido.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConsultaVendaScreen(
                        pedido: pedido[index].pedido,
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
//                                  Flexible(
//                                    flex: 8,
//                                    child: Container(
//                                      padding: EdgeInsets.only(right: 12.0),
//                                      decoration: new BoxDecoration(
//                                        border: new Border(
//                                          right: new BorderSide(
//                                              width: 2.0, color: kCinzaEscuro),
//                                        ),
//                                      ),
//                                      child: Icon(Icons.monetization_on,
//                                          color: kCinzaEscuro),
//                                    ),
//                                  ),
                                  Flexible(
                                    flex: 92,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
//                                          Text(
//                                            pedido[index].razaoSocial,
//                                            overflow: TextOverflow.clip,
//                                            textAlign: TextAlign.center,
//                                            style: TextStyle(
//                                                fontSize: 16.0,
//                                                color: Colors.black,
//                                                fontWeight: FontWeight.w500),
//                                          ),
//                                          Text(
//                                            pedido[index].esFantasia,
//                                            style: TextStyle(
//                                                fontSize: 12.0,
//                                                color: kCinzaEscuro,
//                                                fontWeight: FontWeight.w400),
//                                            textAlign: TextAlign.center,
//                                          ),
//                                          SizedBox(
//                                            height: 3,
//                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Pedido: ",
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kCinzaEscuro,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "${pedido[index].pedido.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      " Emissão: ",
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: kCinzaEscuro,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "${DateFormat("dd/MM/yyyy").format(DateTime.parse(pedido[index].data.toString().substring(0, 10)))}",
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Situação: ",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: kCinzaEscuro,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow:
                                                          TextOverflow.clip,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "${pedido[index].situacao.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: pedido[index]
                                                                    .situacao
                                                                    .toString() ==
                                                                "Aprovado Total"
                                                            ? Colors.green
                                                            : Colors.red,
                                                      ),
                                                      overflow:
                                                          TextOverflow.clip,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      " Atendimento: ",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kCinzaEscuro,
                                                      ),
                                                      overflow:
                                                          TextOverflow.clip,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "${pedido[index].situacaofat.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: pedido[index]
                                                                    .situacaofat
                                                                    .toString() ==
                                                                "Fat.Total"
                                                            ? Colors.green
                                                            : Colors.red,
                                                      ),
                                                      overflow:
                                                          TextOverflow.clip,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
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
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Total Aprovado:",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: kVermelhoBase,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "R\$${formatCurrency.format(pedido[index].valorAprovado)}",
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

  Widget cr() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              itemCount: resumo == null ? 0 : resumo.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return Container(
                  width: 500,
                  child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        compras_detalhe_widget(
                            texto1: 'Total Vencido',
                            texto2:
                                '${resumo[index].crTotalVencidoQtde.toString()}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total Vencido Valor',
                            texto2:
                                'R\$${formatCurrency.format(resumo[index].crTotalVencidoValor)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Mais Antigo',
                            texto2:
                                '${DateFormat("dd/MM/yyyy").format(DateTime.parse(resumo[index].crTotalVencidoMaisAntigo.toString().substring(0, 10)))}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total a Vencer',
                            texto2:
                                '${resumo[index].crTotalAvencerQtde.toString()}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total a Vencer Valor',
                            texto2:
                                'R\$${formatCurrency.format(resumo[index].crTotalAvencerValor)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Útimo T. a Vencer',
                            texto2:
                                '${DateFormat("dd/MM/yyyy").format(DateTime.parse(resumo[index].crTotalAvencerUltimo.toString().substring(0, 10)))}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total',
                            texto2:
                                'R\$${formatCurrency.format(resumo[index].crTotalValor)}'),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(0.0),
                            color: kVermelhoBase,
                            child: MaterialButton(
                              height: 20,
                              minWidth: MediaQuery.of(context).size.width,
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              onPressed: () {},
                              child: InkWell(
                                  child: new Text('Lista CR',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                              fontFamily: 'BebasNeue',
                                              fontSize: 20.0)
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                  onTap: () => Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ConsultaVendaScreen(
                                          pedido: resumo[index].esCodigo,
                                        );
                                      }))),
                            ),
                          ),
                        ),
//                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Rentabilidade',
//                              texto2:
//                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(data.toString().substring(0, 10)))}'),
                        SizedBox(
                          height: 10,
                        ),
                      ],
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

class compras_detalhe_widget extends StatelessWidget {
  const compras_detalhe_widget(
      {Key key, @required this.texto1, @required this.texto2})
      : super(key: key);

  final String texto1;
  final String texto2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            texto1,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              texto2 ?? "-",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans', color: kCinzaEscuro),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}

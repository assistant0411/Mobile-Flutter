import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:mercantis_flutter/models/vendas_detalhe.dart';
import 'package:mercantis_flutter/services/vendas_detalhe.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class VendaDetalheScreen extends StatefulWidget {
  VendaDetalheScreen({
    this.pedido,
  });

  final pedido;

  @override
  _VendaDetalheScreenState createState() => _VendaDetalheScreenState();
}

class _VendaDetalheScreenState extends State<VendaDetalheScreen>
    with SingleTickerProviderStateMixin {
  int cod = 0;
  bool isLoading;
  int _pedido;
  bool _isVisible = true;
  bool _isVisible2 = true;
  bool _isVisible3 = true;

  dynamic cliente;
  dynamic rezaoSocial;
  dynamic fantasia;
  dynamic pedido;
  dynamic data;
  dynamic situacao_ped;
  dynamic tipo_emp;
  dynamic empenho;
  dynamic valorFaturado;
  dynamic valorAFat;
  dynamic valorAP;
  dynamic percRent;
  dynamic es_fantasia;

  dynamic TotCrVencidos;
  dynamic TotCrAVencer;
  dynamic MediaAtraso90Dias;
  dynamic LimiteCredito;
  dynamic CreditoUsado;
  dynamic RentabilidadeCadastro;
  dynamic RentabilidadePedido;
  dynamic CondPagtoPedido;
  dynamic ObsCreditoCadastro;

  dynamic prazomedio;
  dynamic diassemcompramax;
  dynamic diasatrasomax;
  dynamic diasatrasomedio;
  dynamic diasatraso;
  dynamic faturamentomin;

  dynamic cp1;
  dynamic cp2;
  dynamic cp3;
  dynamic cp5;
  dynamic cp4;

  List<Iten> itens = List<Iten>();
  List<Ocorrencia> ocorrencia = List<Ocorrencia>();
  List<InfoLiberacao> info = List<InfoLiberacao>();
  final formatCurrency = NumberFormat("###,##0.00", "pt_BR");

  TabController _tabController;

  @override
  void initState() {
    isLoading = true;
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    _pedido = widget.pedido;
    Services.getVend(_pedido).then((usersFromServer) {
      setState(() {
        TotCrVencidos = usersFromServer.infoLiberacao.totCrVencidos;
        TotCrAVencer = usersFromServer.infoLiberacao.totCrAVencer;
        MediaAtraso90Dias = usersFromServer.infoLiberacao.mediaAtraso90Dias;
        CreditoUsado = usersFromServer.infoLiberacao.creditoUsado;
        RentabilidadePedido = usersFromServer.infoLiberacao.rentabilidadePedido;

        CondPagtoPedido = usersFromServer.infoLiberacao.condPagtoPedido;
        ObsCreditoCadastro =
            usersFromServer.infoLiberacao.infoCredito.obsCredito;
        LimiteCredito = usersFromServer.infoLiberacao.infoCredito.limiteCredito;
        RentabilidadeCadastro =
            usersFromServer.infoLiberacao.infoCredito.rentabilidade;
        prazomedio = usersFromServer.infoLiberacao.infoCredito.prazoMedio;
        diassemcompramax =
            usersFromServer.infoLiberacao.infoCredito.diasSemComprasMax;
        diasatrasomax = usersFromServer.infoLiberacao.infoCredito.diasAtrasoMax;
        diasatrasomedio =
            usersFromServer.infoLiberacao.infoCredito.diasAtrasoMedioMax;
        diasatraso = usersFromServer.infoLiberacao.infoCredito.diasAtraso;
        faturamentomin =
            usersFromServer.infoLiberacao.infoCredito.faturamentoMinimo;

        es_fantasia = usersFromServer.fantasia;

        cliente = usersFromServer.cliente;
        rezaoSocial = usersFromServer.razaoSocial;
        fantasia = usersFromServer.fantasia;
        pedido = usersFromServer.pedido;
        data = usersFromServer.data;
        situacao_ped = usersFromServer.situacao;
        tipo_emp = usersFromServer.tipoEmpenho;
        empenho = usersFromServer.empenho;
        valorFaturado = usersFromServer.valorFaturado;
        valorAFat = usersFromServer.valorAFaturar;
        valorAP = usersFromServer.valorAp;
        cp1 = usersFromServer.infoLiberacao.infoCredito.cp1;
        cp2 = usersFromServer.infoLiberacao.infoCredito.cp2;
        cp3 = usersFromServer.infoLiberacao.infoCredito.cp3;

        percRent = usersFromServer.percRentabilidade;
        print(percRent);
        print(RentabilidadePedido);
        print(RentabilidadeCadastro);
        itens = usersFromServer.itens;
        ocorrencia = usersFromServer.ocorrencias;

        if (usersFromServer.tipoEmpenho == null ||
            usersFromServer.tipoEmpenho == "") _isVisible = !_isVisible;
        if (usersFromServer.empenho == null || usersFromServer.empenho == "")
          _isVisible2 = !_isVisible2;

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
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
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
              icon: new Icon(Icons.assignment),
              text: "Venda",
            ),
            Tab(
              icon: new Icon(Icons.local_grocery_store),
              text: "Itens",
            ),
            Tab(
              icon: new Icon(Icons.library_books),
              text: "Restrições",
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
          cp(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(0.0),
        color: Colors.green,
        child: MaterialButton(
          height: 20,
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Liberar Venda",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 23.0)
                      .copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
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
                              texto1: 'Pedido',
                              texto2: '${_pedido.toString()}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Emissão',
                              texto2:
                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(data.toString().substring(0, 10)))}'),
                          Visibility(visible: _isVisible, child: Divider()),
                          Visibility(
                            visible: _isVisible,
                            child: compras_detalhe_widget(
                                texto1: 'Doc.Cliente', texto2: '$tipo_emp'),
                          ),
                          Visibility(visible: _isVisible2, child: Divider()),
                          Visibility(
                            visible: _isVisible2,
                            child: compras_detalhe_widget(
                                texto1: 'Número', texto2: '$empenho'),
                          ),
                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Valor Faturado',
//                              texto2:
//                                  'R\$${formatCurrency.format(valorFaturado)}'),
//                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Valor a Faturar',
//                              texto2: 'R\$${formatCurrency.format(valorAFat)}'),
//                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Valor Aprovado',
                              texto2: 'R\$${formatCurrency.format(valorAP)}'),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Rentabilidade',
                              texto2:
                                  '${percRent.toString().substring(0, 5)}%'),
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Informações da Liberação",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Total CR Vencido',
                            texto2:
                                'R\$${formatCurrency.format(TotCrVencidos)}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                              texto1: 'Total CR a Vencer',
                              texto2:
                                  'R\$${formatCurrency.format(TotCrAVencer)}'),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Media de Atraso(90dias)',
                            texto2: '$MediaAtraso90Dias',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Crédito Usado',
                            texto2: 'R\$${formatCurrency.format(CreditoUsado)}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Rentabilidade Pedido',
                            texto2:
                                '${RentabilidadePedido.toString().substring(0, 5)}%',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Cond. Pag. Pedido',
                            texto2: '$CondPagtoPedido',
                          ),
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
                          ExpandablePanel(
                            theme: ExpandableThemeData(
                              iconColor: kVermelhoBase,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.report_problem,
                                    size: 20,
                                    color: kVermelhoBase,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Observação de Crédito',
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
                            expanded: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '$ObsCreditoCadastro',
                                softWrap: true,
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Informações de Crédito",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Limite de Crédito',
                            texto2:
                                'R\$${formatCurrency.format(LimiteCredito)}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Rentabilidade Desejada',
                            texto2: '${RentabilidadeCadastro.toString()}%',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Prazo Médio',
                            texto2: '$prazomedio',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Dias Sem Compra Máx.',
                            texto2: '${diassemcompramax}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Dias Atraso Máx.',
                            texto2: '${diasatrasomax}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Dias Atraso Médio Máx.',
                            texto2: '$diasatrasomedio',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Dias Atraso',
                            texto2: '$diasatraso',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Faturamento Mín.',
                            texto2:
                                'R\$${formatCurrency.format(faturamentomin)}',
                          ),
                          Divider(),
                          compras_detalhe_widget(
                            texto1: 'Cond. Pagamento',
                            texto2:
                                '${cp1.toString()}, ${cp2.toString()}, ${cp3.toString()} dias',
                          ),
                          SizedBox(
                            height: 10,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Total: ${itens.length} itens",
                style: TextStyle(
                  color: kCinzaSubtitulo,
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                )),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: itens == null ? 0 : itens.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return Container(
                  width: 500,
                  child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 90,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "${itens[index].dsMaterial}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'OpenSans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Text(
                                        "${itens[index].item.toString()}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'OpenSans',
                                            color: kBranco,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.clip,
                                      ),
                                      backgroundColor: kVermelhoBase,
                                      radius: 12.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Unidade',
                            texto2: '${itens[index].dsUnidade.toString()}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Quantidade',
                            texto2:
                                '${itens[index].quantidade.toStringAsFixed(0)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Preço Unitário',
                            texto2:
                                'R\$${formatCurrency.format(itens[index].precoUnitario)}'),
                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Total',
                            texto2:
                                'R\$${formatCurrency.format(itens[index].precoTotal)}'),
                        Divider(),
//                        compras_detalhe_widget(
//                            texto1: 'Rentabilidade',
//                            texto2:
//                                'R${formatCurrency.format(itens[index].rentabilidade)}'),
//                        Divider(),
                        compras_detalhe_widget(
                            texto1: 'Rentabilidade %',
                            texto2:
                                '${itens[index].percRentabilidade.toStringAsFixed(3)}%'),
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

  Widget cp() {
    return Scaffold(
      backgroundColor: kCinzaClaroAzulado,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: ocorrencia == null ? 0 : ocorrencia.length,
              itemBuilder: (BuildContext context, int index) {
                //return makeCard;
                return Container(
                  width: 500,
                  child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "${ocorrencia[index].dsOcorrencia}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'OpenSans',
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Conditional.single(
                                context: context,
                                conditionBuilder: (BuildContext context) =>
                                    ocorrencia[index].nomeUsrAutorizou != null,
                                widgetBuilder: (BuildContext context) =>
                                    Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "Liberada",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w400,
                                            color: Colors.lightGreen),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.lock_open,
                                        color: Colors.lightGreen,
                                      )
                                    ],
                                  ),
                                ),
                                fallbackBuilder: (BuildContext context) =>
                                    Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Não liberada',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: kVermelhoBase,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.lock_outline,
                                        color: kVermelhoBase,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
              texto2,
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
//docker-compose -f docker-compose-prod.yml build app
//docker-compose -f docker-compose-prod.yml run --rm app rake db:create db:migrate
//
//docker-compose -f docker-compose-prod.yml up -d app

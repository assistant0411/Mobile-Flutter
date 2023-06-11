// To parse this JSON data, do
//
//     final listaCompras = listaComprasFromJson(jsonString);

import 'dart:convert';

class ListaCompras {
  final Info info;

  ListaCompras({
    this.info,
  });

  factory ListaCompras.fromJson(String str) =>
      ListaCompras.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaCompras.fromMap(Map<String, dynamic> json) => ListaCompras(
        info: json["Info"] == null ? null : Info.fromMap(json["Info"]),
      );

  Map<String, dynamic> toMap() => {
        "Info": info == null ? null : info.toMap(),
      };
}

class Info {
  final DateTime dataGeracao;
  final String funcao;
  final int quantidade;
  final int pagina;
  final List<Compras> compras;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.compras,
  });

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        dataGeracao: json["DataGeracao"] == null
            ? null
            : DateTime.parse(json["DataGeracao"]),
        funcao: json["Funcao"] == null ? null : json["Funcao"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        pagina: json["Pagina"] == null ? null : json["Pagina"],
        compras: json["Itens"] == null
            ? null
            : List<Compras>.from(json["Itens"].map((x) => Compras.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Itens": compras == null
            ? null
            : List<dynamic>.from(compras.map((x) => x.toMap())),
      };
}

class Compras {
  final int pedido;
  final DateTime emissao;
  final String atendimento;
  final String situacao;
  final int fornecedor;
  final dynamic fornecedorFantasia;
  final int compradorCod;
  final String compradorNome;
  final String dsMotivoCompra;
  final dynamic docTipoDs;
  final dynamic docTipoNumero;
  final String frete;
  final dynamic transportadora;
  final double freteValor;
  final dynamic totalIpi;
  final dynamic totalAtendido;
  final dynamic totalPendente;
  final dynamic totalPedido;
  final List<dynamic> itens;
  final List<dynamic> cp;
  final List<dynamic> prazosEntrega;
  final Obs obs;

  Compras({
    this.pedido,
    this.emissao,
    this.atendimento,
    this.situacao,
    this.fornecedor,
    this.fornecedorFantasia,
    this.compradorCod,
    this.compradorNome,
    this.dsMotivoCompra,
    this.docTipoDs,
    this.docTipoNumero,
    this.frete,
    this.transportadora,
    this.freteValor,
    this.totalIpi,
    this.totalAtendido,
    this.totalPendente,
    this.totalPedido,
    this.itens,
    this.cp,
    this.prazosEntrega,
    this.obs,
  });

  factory Compras.fromJson(String str) => Compras.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Compras.fromMap(Map<String, dynamic> json) => Compras(
        pedido: json["Pedido"] == null ? null : json["Pedido"],
        emissao:
            json["Emissao"] == null ? null : DateTime.parse(json["Emissao"]),
        atendimento: json["Atendimento"] == null ? null : json["Atendimento"],
        situacao: json["Situacao"] == null ? null : json["Situacao"],
        fornecedor: json["Fornecedor"] == null ? null : json["Fornecedor"],
        fornecedorFantasia: json["Fornecedor_Fantasia"],
        compradorCod:
            json["Comprador_Cod"] == null ? null : json["Comprador_Cod"],
        compradorNome:
            json["Comprador_Nome"] == null ? null : json["Comprador_Nome"],
        dsMotivoCompra:
            json["Ds_Motivo_Compra"] == null ? null : json["Ds_Motivo_Compra"],
        docTipoDs: json["Doc_Tipo_Ds"],
        docTipoNumero: json["Doc_Tipo_Numero"],
        frete: json["Frete"] == null ? null : json["Frete"],
        transportadora: json["Transportadora"],
        freteValor: json["Frete_Valor"] == null ? null : json["Frete_Valor"],
        totalIpi: json["Total_IPI"] == null ? null : json["Total_IPI"],
        totalAtendido:
            json["Total_Atendido"] == null ? null : json["Total_Atendido"],
        totalPendente:
            json["Total_Pendente"] == null ? null : json["Total_Pendente"],
        totalPedido: json["Total_Pedido"] == null ? null : json["Total_Pedido"],
        itens: json["Itens"] == null
            ? null
            : List<dynamic>.from(json["Itens"].map((x) => x)),
        cp: json["CP"] == null
            ? null
            : List<dynamic>.from(json["CP"].map((x) => x)),
        prazosEntrega: json["PrazosEntrega"] == null
            ? null
            : List<dynamic>.from(json["PrazosEntrega"].map((x) => x)),
        obs: json["Obs"] == null ? null : Obs.fromMap(json["Obs"]),
      );

  Map<String, dynamic> toMap() => {
        "Pedido": pedido == null ? null : pedido,
        "Emissao": emissao == null ? null : emissao.toIso8601String(),
        "Atendimento": atendimento == null ? null : atendimento,
        "Situacao": situacao == null ? null : situacao,
        "Fornecedor": fornecedor == null ? null : fornecedor,
        "Fornecedor_Fantasia": fornecedorFantasia,
        "Comprador_Cod": compradorCod == null ? null : compradorCod,
        "Comprador_Nome": compradorNome == null ? null : compradorNome,
        "Ds_Motivo_Compra": dsMotivoCompra == null ? null : dsMotivoCompra,
        "Doc_Tipo_Ds": docTipoDs,
        "Doc_Tipo_Numero": docTipoNumero,
        "Frete": frete == null ? null : frete,
        "Transportadora": transportadora,
        "Frete_Valor": freteValor == null ? null : freteValor,
        "Total_IPI": totalIpi == null ? null : totalIpi,
        "Total_Atendido": totalAtendido == null ? null : totalAtendido,
        "Total_Pendente": totalPendente == null ? null : totalPendente,
        "Total_Pedido": totalPedido == null ? null : totalPedido,
        "Itens": itens == null ? null : List<dynamic>.from(itens.map((x) => x)),
        "CP": cp == null ? null : List<dynamic>.from(cp.map((x) => x)),
        "PrazosEntrega": prazosEntrega == null
            ? null
            : List<dynamic>.from(prazosEntrega.map((x) => x)),
        "Obs": obs == null ? null : obs.toMap(),
      };
}

class Obs {
  final String obs;
  final String obsInterna;

  Obs({
    this.obs,
    this.obsInterna,
  });

  factory Obs.fromJson(String str) => Obs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Obs.fromMap(Map<String, dynamic> json) => Obs(
        obs: json["Obs"] == null ? null : json["Obs"],
        obsInterna: json["ObsInterna"] == null ? null : json["ObsInterna"],
      );

  Map<String, dynamic> toMap() => {
        "Obs": obs == null ? null : obs,
        "ObsInterna": obsInterna == null ? null : obsInterna,
      };
}

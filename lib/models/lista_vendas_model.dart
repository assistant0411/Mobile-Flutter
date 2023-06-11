// To parse this JSON data, do
//
//     final listaVendas = listaVendasFromJson(jsonString);

import 'dart:convert';

class ListaVendas {
  final Info info;

  ListaVendas({
    this.info,
  });

  ListaVendas copyWith({
    Info info,
  }) =>
      ListaVendas(
        info: info ?? this.info,
      );

  factory ListaVendas.fromJson(String str) =>
      ListaVendas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaVendas.fromMap(Map<String, dynamic> json) => ListaVendas(
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
  final List<Iten> itens;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.itens,
  });

  Info copyWith({
    DateTime dataGeracao,
    String funcao,
    int quantidade,
    int pagina,
    List<Iten> itens,
  }) =>
      Info(
        dataGeracao: dataGeracao ?? this.dataGeracao,
        funcao: funcao ?? this.funcao,
        quantidade: quantidade ?? this.quantidade,
        pagina: pagina ?? this.pagina,
        itens: itens ?? this.itens,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        dataGeracao: json["DataGeracao"] == null
            ? null
            : DateTime.parse(json["DataGeracao"]),
        funcao: json["Funcao"] == null ? null : json["Funcao"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        pagina: json["Pagina"] == null ? null : json["Pagina"],
        itens: json["Itens"] == null
            ? null
            : List<Iten>.from(json["Itens"].map((x) => Iten.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Itens": itens == null
            ? null
            : List<dynamic>.from(itens.map((x) => x.toMap())),
      };
}

class Iten {
  final int esCodigo;
  final int pedido;
  final DateTime data;
  final int cliente;
  final String razaoSocial;
  final String fantasia;
  final String situacaofat;
  final String situacao;
  final double valorAFaturar;

  Iten({
    this.esCodigo,
    this.pedido,
    this.data,
    this.cliente,
    this.razaoSocial,
    this.fantasia,
    this.situacaofat,
    this.situacao,
    this.valorAFaturar,
  });

  Iten copyWith({
    int esCodigo,
    int pedido,
    DateTime data,
    int cliente,
    String razaoSocial,
    String fantasia,
    String situacaofat,
    String situacao,
    double valorAFaturar,
  }) =>
      Iten(
        esCodigo: esCodigo ?? this.esCodigo,
        pedido: pedido ?? this.pedido,
        data: data ?? this.data,
        cliente: cliente ?? this.cliente,
        razaoSocial: razaoSocial ?? this.razaoSocial,
        fantasia: fantasia ?? this.fantasia,
        situacaofat: situacaofat ?? this.situacaofat,
        situacao: situacao ?? this.situacao,
        valorAFaturar: valorAFaturar ?? this.valorAFaturar,
      );

  factory Iten.fromJson(String str) => Iten.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Iten.fromMap(Map<String, dynamic> json) => Iten(
        esCodigo: json["es_codigo"] == null ? null : json["es_codigo"],
        pedido: json["pedido"] == null ? null : json["pedido"],
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        cliente: json["cliente"] == null ? null : json["cliente"],
        razaoSocial: json["razao_social"] == null ? null : json["razao_social"],
        fantasia: json["fantasia"] == null ? null : json["fantasia"],
        situacaofat: json["situacaofat"] == null ? null : json["situacaofat"],
        situacao: json["situacao"] == null ? null : json["situacao"],
        valorAFaturar: json["valorAFaturar"] == null
            ? null
            : json["valorAFaturar"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "es_codigo": esCodigo == null ? null : esCodigo,
        "pedido": pedido == null ? null : pedido,
        "data": data == null ? null : data.toIso8601String(),
        "cliente": cliente == null ? null : cliente,
        "razao_social": razaoSocial == null ? null : razaoSocial,
        "fantasia": fantasia == null ? null : fantasia,
        "situacaofat": situacaofat == null ? null : situacaofat,
        "situacao": situacao == null ? null : situacao,
        "valorAFaturar": valorAFaturar == null ? null : valorAFaturar,
      };
}

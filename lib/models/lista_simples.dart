// To parse this JSON data, do
//
//     final listaSimples = listaSimplesFromJson(jsonString);

import 'dart:convert';

ListaSimples listaSimplesFromJson(String str) =>
    ListaSimples.fromMap(json.decode(str));

String listaSimplesToJson(ListaSimples data) => json.encode(data.toMap());

class ListaSimples {
  final Info info;

  ListaSimples({
    this.info,
  });

  factory ListaSimples.fromMap(Map<String, dynamic> json) => ListaSimples(
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
  final List<ClienteSimples> clientes;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.clientes,
  });

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        dataGeracao: json["DataGeracao"] == null
            ? null
            : DateTime.parse(json["DataGeracao"]),
        funcao: json["Funcao"] == null ? null : json["Funcao"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        pagina: json["Pagina"] == null ? null : json["Pagina"],
        clientes: json["Itens"] == null
            ? null
            : List<ClienteSimples>.from(
                json["Itens"].map((x) => ClienteSimples.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Itens": clientes == null
            ? null
            : List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}

class ClienteSimples {
  final int cliente;
  final String fantasia;
  final String cnpj;

  ClienteSimples({
    this.cliente,
    this.fantasia,
    this.cnpj,
  });

  factory ClienteSimples.fromMap(Map<String, dynamic> json) => ClienteSimples(
        cliente: json["Cliente"] == null ? null : json["Cliente"],
        fantasia: json["Fantasia"] == null ? null : json["Fantasia"],
        cnpj: json["CNPJ"] == null ? null : json["CNPJ"],
      );

  Map<String, dynamic> toMap() => {
        "Cliente": cliente == null ? null : cliente,
        "Fantasia": fantasia == null ? null : fantasia,
        "CNPJ": cnpj == null ? null : cnpj,
      };
}

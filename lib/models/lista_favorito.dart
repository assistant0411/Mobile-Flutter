// To parse this JSON data, do
//
//     final listaFavorito = listaFavoritoFromJson(jsonString);

import 'dart:convert';

ListaFavorito listaFavoritoFromJson(String str) =>
    ListaFavorito.fromMap(json.decode(str));

String listaFavoritoToJson(ListaFavorito data) => json.encode(data.toMap());

class ListaFavorito {
  final Info info;

  ListaFavorito({
    this.info,
  });

  factory ListaFavorito.fromJson(String str) =>
      ListaFavorito.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListaFavorito.fromMap(Map<String, dynamic> json) => ListaFavorito(
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
  final List<FavoritoSimples> favoritos;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.favoritos,
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
        favoritos: json["Itens"] == null
            ? null
            : List<FavoritoSimples>.from(
                json["Itens"].map((x) => FavoritoSimples.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Itens": favoritos == null
            ? null
            : List<dynamic>.from(favoritos.map((x) => x.toMap())),
      };
}

class FavoritoSimples {
  final int cliente;
  final String fantasia;
  final String cnpj;

  FavoritoSimples({
    this.cliente,
    this.fantasia,
    this.cnpj,
  });

  factory FavoritoSimples.fromJson(String str) =>
      FavoritoSimples.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoritoSimples.fromMap(Map<String, dynamic> json) => FavoritoSimples(
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

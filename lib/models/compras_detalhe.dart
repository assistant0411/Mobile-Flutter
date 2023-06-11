// To parse this JSON data, do
//
//     final comprasDetalhe = comprasDetalheFromJson(jsonString);

import 'dart:convert';

class ComprasDetalhe {
  final Info info;

  ComprasDetalhe({
    this.info,
  });

  factory ComprasDetalhe.fromJson(String str) =>
      ComprasDetalhe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComprasDetalhe.fromMap(Map<String, dynamic> json) => ComprasDetalhe(
        info: json["Info"] == null ? null : Info.fromMap(json["Info"]),
      );

  Map<String, dynamic> toMap() => {
        "Info": info == null ? null : info.toMap(),
      };
}

class Info {
  final DateTime dataGeracao;
  final String funcao;
  final dynamic quantidade;
  final dynamic pagina;
  final PedidoCompra pedidoCompra;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.pedidoCompra,
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
        pedidoCompra:
            json["Item"] == null ? null : PedidoCompra.fromMap(json["Item"]),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Item": pedidoCompra == null ? null : pedidoCompra.toMap(),
      };
}

class PedidoCompra {
  final dynamic pedido;
  final DateTime emissao;
  final dynamic esCodigo;
  final String esLogin;
  final String esFantasia;
  final String atendimento;
  final String situacao;
  final dynamic fornecedor;
  final String fornecedorFantasia;
  final dynamic compradorCod;
  final String compradorNome;
  final String dsMotivoCompra;
  final dynamic docTipoDs;
  final dynamic docTipoNumero;
  final String frete;
  final dynamic transportadora;
  final dynamic freteValor;
  final dynamic totalIpi;
  final dynamic totalAtendido;
  final dynamic totalPendente;
  final dynamic totalPedido;
  final List<Produto> produtos;
  final List<Cp> cp;
  final List<PrazosEntrega> prazosEntrega;
  final Obs obs;

  PedidoCompra({
    this.pedido,
    this.emissao,
    this.esCodigo,
    this.esLogin,
    this.esFantasia,
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
    this.produtos,
    this.cp,
    this.prazosEntrega,
    this.obs,
  });

  factory PedidoCompra.fromJson(String str) =>
      PedidoCompra.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PedidoCompra.fromMap(Map<String, dynamic> json) => PedidoCompra(
        pedido: json["Pedido"] == null ? null : json["Pedido"],
        emissao:
            json["Emissao"] == null ? null : DateTime.parse(json["Emissao"]),
        esCodigo: json["es_codigo"] == null ? null : json["es_codigo"],
        esLogin: json["es_login"] == null ? null : json["es_login"],
        esFantasia: json["es_fantasia"] == null ? null : json["es_fantasia"],
        atendimento: json["Atendimento"] == null ? null : json["Atendimento"],
        situacao: json["Situacao"] == null ? null : json["Situacao"],
        fornecedor: json["Fornecedor"] == null ? null : json["Fornecedor"],
        fornecedorFantasia: json["Fornecedor_Fantasia"] == null
            ? null
            : json["Fornecedor_Fantasia"],
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
        totalPendente: json["Total_Pendente"] == null
            ? null
            : json["Total_Pendente"].toDouble(),
        totalPedido: json["Total_Pedido"] == null
            ? null
            : json["Total_Pedido"].toDouble(),
        produtos: json["Produtos"] == null
            ? null
            : List<Produto>.from(
                json["Produtos"].map((x) => Produto.fromMap(x))),
        cp: json["CP"] == null
            ? null
            : List<Cp>.from(json["CP"].map((x) => Cp.fromMap(x))),
        prazosEntrega: json["PrazosEntrega"] == null
            ? null
            : List<PrazosEntrega>.from(
                json["PrazosEntrega"].map((x) => PrazosEntrega.fromMap(x))),
        obs: json["Obs"] == null ? null : Obs.fromMap(json["Obs"]),
      );

  Map<String, dynamic> toMap() => {
        "Pedido": pedido == null ? null : pedido,
        "Emissao": emissao == null ? null : emissao.toIso8601String(),
        "es_codigo": esCodigo == null ? null : esCodigo,
        "es_login": esLogin == null ? null : esLogin,
        "es_fantasia": esFantasia == null ? null : esFantasia,
        "Atendimento": atendimento == null ? null : atendimento,
        "Situacao": situacao == null ? null : situacao,
        "Fornecedor": fornecedor == null ? null : fornecedor,
        "Fornecedor_Fantasia":
            fornecedorFantasia == null ? null : fornecedorFantasia,
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
        "Produtos": produtos == null
            ? null
            : List<dynamic>.from(produtos.map((x) => x.toMap())),
        "CP": cp == null ? null : List<dynamic>.from(cp.map((x) => x.toMap())),
        "PrazosEntrega": prazosEntrega == null
            ? null
            : List<dynamic>.from(prazosEntrega.map((x) => x.toMap())),
        "Obs": obs == null ? null : obs.toMap(),
      };
}

class Cp {
  final dynamic prazo;
  final DateTime data;
  final dynamic valor;

  Cp({
    this.prazo,
    this.data,
    this.valor,
  });

  factory Cp.fromJson(String str) => Cp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cp.fromMap(Map<String, dynamic> json) => Cp(
        prazo: json["Prazo"] == null ? null : json["Prazo"],
        data: json["Data"] == null ? null : DateTime.parse(json["Data"]),
        valor: json["Valor"] == null ? null : json["Valor"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "Prazo": prazo == null ? null : prazo,
        "Data": data == null ? null : data.toIso8601String(),
        "Valor": valor == null ? null : valor,
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

class PrazosEntrega {
  final dynamic seq;
  final dynamic numeroCp;
  final dynamic prazo;
  final dynamic valor;
  final DateTime data;

  PrazosEntrega({
    this.seq,
    this.numeroCp,
    this.prazo,
    this.valor,
    this.data,
  });

  factory PrazosEntrega.fromJson(String str) =>
      PrazosEntrega.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrazosEntrega.fromMap(Map<String, dynamic> json) => PrazosEntrega(
        seq: json["Seq"] == null ? null : json["Seq"],
        numeroCp: json["NumeroCP"] == null ? null : json["NumeroCP"],
        prazo: json["Prazo"] == null ? null : json["Prazo"],
        valor: json["Valor"] == null ? null : json["Valor"],
        data: json["Data"] == null ? null : DateTime.parse(json["Data"]),
      );

  Map<String, dynamic> toMap() => {
        "Seq": seq == null ? null : seq,
        "NumeroCP": numeroCp == null ? null : numeroCp,
        "Prazo": prazo == null ? null : prazo,
        "Valor": valor == null ? null : valor,
        "Data": data == null ? null : data.toIso8601String(),
      };
}

class Produto {
  final dynamic seq;
  final dynamic item;
  final dynamic material;
  final String dsMaterial;
  final dynamic ipi;
  final dynamic codUnidade;
  final String dsCodUnidade;
  final dynamic quantidadeUnidade;
  final dynamic valorUnitarioUnidade;
  final String unidade;
  final dynamic quantidade;
  final dynamic valorUnitario;
  final dynamic quantidadeEmAtendimento;
  final dynamic quantidadeAtendida;
  final dynamic saldo;

  Produto({
    this.seq,
    this.item,
    this.material,
    this.dsMaterial,
    this.ipi,
    this.codUnidade,
    this.dsCodUnidade,
    this.quantidadeUnidade,
    this.valorUnitarioUnidade,
    this.unidade,
    this.quantidade,
    this.valorUnitario,
    this.quantidadeEmAtendimento,
    this.quantidadeAtendida,
    this.saldo,
  });

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        seq: json["Seq"] == null ? null : json["Seq"],
        item: json["Item"] == null ? null : json["Item"],
        material: json["Material"] == null ? null : json["Material"],
        dsMaterial: json["Ds_Material"] == null ? null : json["Ds_Material"],
        ipi: json["IPI"] == null ? null : json["IPI"],
        codUnidade: json["Cod_Unidade"] == null ? null : json["Cod_Unidade"],
        dsCodUnidade:
            json["Ds_Cod_Unidade"] == null ? null : json["Ds_Cod_Unidade"],
        quantidadeUnidade: json["QuantidadeUnidade"] == null
            ? null
            : json["QuantidadeUnidade"],
        valorUnitarioUnidade: json["ValorUnitarioUnidade"] == null
            ? null
            : json["ValorUnitarioUnidade"].toDouble(),
        unidade: json["Unidade"] == null ? null : json["Unidade"],
        quantidade: json["Quantidade"] == null ? null : json["Quantidade"],
        valorUnitario: json["ValorUnitario"] == null
            ? null
            : json["ValorUnitario"].toDouble(),
        quantidadeEmAtendimento: json["QuantidadeEmAtendimento"] == null
            ? null
            : json["QuantidadeEmAtendimento"],
        quantidadeAtendida: json["QuantidadeAtendida"] == null
            ? null
            : json["QuantidadeAtendida"],
        saldo: json["Saldo"] == null ? null : json["Saldo"],
      );

  Map<String, dynamic> toMap() => {
        "Seq": seq == null ? null : seq,
        "Item": item == null ? null : item,
        "Material": material == null ? null : material,
        "Ds_Material": dsMaterial == null ? null : dsMaterial,
        "IPI": ipi == null ? null : ipi,
        "Cod_Unidade": codUnidade == null ? null : codUnidade,
        "Ds_Cod_Unidade": dsCodUnidade == null ? null : dsCodUnidade,
        "QuantidadeUnidade":
            quantidadeUnidade == null ? null : quantidadeUnidade,
        "ValorUnitarioUnidade":
            valorUnitarioUnidade == null ? null : valorUnitarioUnidade,
        "Unidade": unidade == null ? null : unidade,
        "Quantidade": quantidade == null ? null : quantidade,
        "ValorUnitario": valorUnitario == null ? null : valorUnitario,
        "QuantidadeEmAtendimento":
            quantidadeEmAtendimento == null ? null : quantidadeEmAtendimento,
        "QuantidadeAtendida":
            quantidadeAtendida == null ? null : quantidadeAtendida,
        "Saldo": saldo == null ? null : saldo,
      };
}

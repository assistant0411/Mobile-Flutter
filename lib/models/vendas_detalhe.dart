// To parse this JSON data, do
//
//     final vendasDetalhe = vendasDetalheFromJson(jsonString);

import 'dart:convert';

class VendasDetalhe {
  final Info info;

  VendasDetalhe({
    this.info,
  });

  VendasDetalhe copyWith({
    Info info,
  }) =>
      VendasDetalhe(
        info: info ?? this.info,
      );

  factory VendasDetalhe.fromJson(String str) =>
      VendasDetalhe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendasDetalhe.fromMap(Map<String, dynamic> json) => VendasDetalhe(
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
  final Item item;

  Info({
    this.dataGeracao,
    this.funcao,
    this.quantidade,
    this.pagina,
    this.item,
  });

  Info copyWith({
    DateTime dataGeracao,
    String funcao,
    dynamic quantidade,
    dynamic pagina,
    Item item,
  }) =>
      Info(
        dataGeracao: dataGeracao ?? this.dataGeracao,
        funcao: funcao ?? this.funcao,
        quantidade: quantidade ?? this.quantidade,
        pagina: pagina ?? this.pagina,
        item: item ?? this.item,
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
        item: json["Item"] == null ? null : Item.fromMap(json["Item"]),
      );

  Map<String, dynamic> toMap() => {
        "DataGeracao":
            dataGeracao == null ? null : dataGeracao.toIso8601String(),
        "Funcao": funcao == null ? null : funcao,
        "Quantidade": quantidade == null ? null : quantidade,
        "Pagina": pagina == null ? null : pagina,
        "Item": item == null ? null : item.toMap(),
      };
}

class Item {
  final dynamic esCodigo;
  final dynamic pedido;
  final DateTime data;
  final dynamic cliente;
  final String razaoSocial;
  final String fantasia;
  final String situacaofat;
  final String situacao;
  final String tipoEmpenho;
  final String empenho;
  final dynamic valorFaturado;
  final dynamic valorAFaturar;
  final dynamic valorAp;
  final dynamic percRentabilidade;
  final List<Iten> itens;
  final List<Ocorrencia> ocorrencias;
  final InfoLiberacao infoLiberacao;
  final Observacoes observacoes;

  Item({
    this.esCodigo,
    this.pedido,
    this.data,
    this.cliente,
    this.razaoSocial,
    this.fantasia,
    this.situacaofat,
    this.situacao,
    this.tipoEmpenho,
    this.empenho,
    this.valorFaturado,
    this.valorAFaturar,
    this.valorAp,
    this.percRentabilidade,
    this.itens,
    this.ocorrencias,
    this.infoLiberacao,
    this.observacoes,
  });

  Item copyWith({
    dynamic esCodigo,
    dynamic pedido,
    DateTime data,
    dynamic cliente,
    String razaoSocial,
    String fantasia,
    String situacaofat,
    String situacao,
    String tipoEmpenho,
    String empenho,
    dynamic valorFaturado,
    dynamic valorAFaturar,
    dynamic valorAp,
    dynamic percRentabilidade,
    List<Iten> itens,
    List<Ocorrencia> ocorrencias,
    InfoLiberacao infoLiberacao,
    Observacoes observacoes,
  }) =>
      Item(
        esCodigo: esCodigo ?? this.esCodigo,
        pedido: pedido ?? this.pedido,
        data: data ?? this.data,
        cliente: cliente ?? this.cliente,
        razaoSocial: razaoSocial ?? this.razaoSocial,
        fantasia: fantasia ?? this.fantasia,
        situacaofat: situacaofat ?? this.situacaofat,
        situacao: situacao ?? this.situacao,
        tipoEmpenho: tipoEmpenho ?? this.tipoEmpenho,
        empenho: empenho ?? this.empenho,
        valorFaturado: valorFaturado ?? this.valorFaturado,
        valorAFaturar: valorAFaturar ?? this.valorAFaturar,
        valorAp: valorAp ?? this.valorAp,
        percRentabilidade: percRentabilidade ?? this.percRentabilidade,
        itens: itens ?? this.itens,
        ocorrencias: ocorrencias ?? this.ocorrencias,
        infoLiberacao: infoLiberacao ?? this.infoLiberacao,
        observacoes: observacoes ?? this.observacoes,
      );

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        esCodigo: json["es_codigo"] == null ? null : json["es_codigo"],
        pedido: json["pedido"] == null ? null : json["pedido"],
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        cliente: json["cliente"] == null ? null : json["cliente"],
        razaoSocial: json["razao_social"] == null ? null : json["razao_social"],
        fantasia: json["fantasia"] == null ? null : json["fantasia"],
        situacaofat: json["situacaofat"] == null ? null : json["situacaofat"],
        situacao: json["situacao"] == null ? null : json["situacao"],
        tipoEmpenho: json["tipo_empenho"] == null ? null : json["tipo_empenho"],
        empenho: json["empenho"] == null ? null : json["empenho"],
        valorFaturado:
            json["valorFaturado"] == null ? null : json["valorFaturado"],
        valorAFaturar: json["valorAFaturar"] == null
            ? null
            : json["valorAFaturar"].toDouble(),
        valorAp: json["valorAP"] == null ? null : json["valorAP"].toDouble(),
        percRentabilidade: json["percRentabilidade"] == null
            ? null
            : json["percRentabilidade"].toDouble(),
        itens: json["Itens"] == null
            ? null
            : List<Iten>.from(json["Itens"].map((x) => Iten.fromMap(x))),
        ocorrencias: json["Ocorrencias"] == null
            ? null
            : List<Ocorrencia>.from(
                json["Ocorrencias"].map((x) => Ocorrencia.fromMap(x))),
        infoLiberacao: json["InfoLiberacao"] == null
            ? null
            : InfoLiberacao.fromMap(json["InfoLiberacao"]),
        observacoes: json["Observacoes"] == null
            ? null
            : Observacoes.fromMap(json["Observacoes"]),
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
        "tipo_empenho": tipoEmpenho == null ? null : tipoEmpenho,
        "empenho": empenho == null ? null : empenho,
        "valorFaturado": valorFaturado == null ? null : valorFaturado,
        "valorAFaturar": valorAFaturar == null ? null : valorAFaturar,
        "valorAP": valorAp == null ? null : valorAp,
        "percRentabilidade":
            percRentabilidade == null ? null : percRentabilidade,
        "Itens": itens == null
            ? null
            : List<dynamic>.from(itens.map((x) => x.toMap())),
        "Ocorrencias": ocorrencias == null
            ? null
            : List<dynamic>.from(ocorrencias.map((x) => x.toMap())),
        "InfoLiberacao": infoLiberacao == null ? null : infoLiberacao.toMap(),
        "Observacoes": observacoes == null ? null : observacoes.toMap(),
      };
}

class InfoLiberacao {
  final dynamic totCrVencidos;
  final dynamic totCrAVencer;
  final String mediaAtraso90Dias;
  final dynamic creditoUsado;
  final dynamic rentabilidadePedido;
  final String condPagtoPedido;
  final InfoCredito infoCredito;

  InfoLiberacao({
    this.totCrVencidos,
    this.totCrAVencer,
    this.mediaAtraso90Dias,
    this.creditoUsado,
    this.rentabilidadePedido,
    this.condPagtoPedido,
    this.infoCredito,
  });

  InfoLiberacao copyWith({
    dynamic totCrVencidos,
    dynamic totCrAVencer,
    String mediaAtraso90Dias,
    dynamic creditoUsado,
    dynamic rentabilidadePedido,
    String condPagtoPedido,
    InfoCredito infoCredito,
  }) =>
      InfoLiberacao(
        totCrVencidos: totCrVencidos ?? this.totCrVencidos,
        totCrAVencer: totCrAVencer ?? this.totCrAVencer,
        mediaAtraso90Dias: mediaAtraso90Dias ?? this.mediaAtraso90Dias,
        creditoUsado: creditoUsado ?? this.creditoUsado,
        rentabilidadePedido: rentabilidadePedido ?? this.rentabilidadePedido,
        condPagtoPedido: condPagtoPedido ?? this.condPagtoPedido,
        infoCredito: infoCredito ?? this.infoCredito,
      );

  factory InfoLiberacao.fromJson(String str) =>
      InfoLiberacao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoLiberacao.fromMap(Map<String, dynamic> json) => InfoLiberacao(
        totCrVencidos: json["TotCrVencidos"] == null
            ? null
            : json["TotCrVencidos"].toDouble(),
        totCrAVencer:
            json["TotCrAVencer"] == null ? null : json["TotCrAVencer"],
        mediaAtraso90Dias: json["MediaAtraso90Dias"] == null
            ? null
            : json["MediaAtraso90Dias"],
        creditoUsado:
            json["CreditoUsado"] == null ? null : json["CreditoUsado"],
        rentabilidadePedido: json["RentabilidadePedido"] == null
            ? null
            : json["RentabilidadePedido"].toDouble(),
        condPagtoPedido:
            json["CondPagtoPedido"] == null ? null : json["CondPagtoPedido"],
        infoCredito: json["InfoCredito"] == null
            ? null
            : InfoCredito.fromMap(json["InfoCredito"]),
      );

  Map<String, dynamic> toMap() => {
        "TotCrVencidos": totCrVencidos == null ? null : totCrVencidos,
        "TotCrAVencer": totCrAVencer == null ? null : totCrAVencer,
        "MediaAtraso90Dias":
            mediaAtraso90Dias == null ? null : mediaAtraso90Dias,
        "CreditoUsado": creditoUsado == null ? null : creditoUsado,
        "RentabilidadePedido":
            rentabilidadePedido == null ? null : rentabilidadePedido,
        "CondPagtoPedido": condPagtoPedido == null ? null : condPagtoPedido,
        "InfoCredito": infoCredito == null ? null : infoCredito.toMap(),
      };
}

class InfoCredito {
  final String tipoCobranca;
  final String cp1;
  final String cp2;
  final String cp3;
  final String cp4;
  final String cp5;
  final dynamic prazoMedio;
  final dynamic limiteCredito;
  final dynamic rentabilidade;
  final dynamic liberarPedidoAposSeparacao;
  final dynamic diasSemComprasMax;
  final dynamic diasAtrasoMax;
  final dynamic diasAtrasoMedioMax;
  final dynamic diasAtraso;
  final dynamic faturamentoMinimo;
  final String obsCredito;

  InfoCredito({
    this.tipoCobranca,
    this.cp1,
    this.cp2,
    this.cp3,
    this.cp4,
    this.cp5,
    this.prazoMedio,
    this.limiteCredito,
    this.rentabilidade,
    this.liberarPedidoAposSeparacao,
    this.diasSemComprasMax,
    this.diasAtrasoMax,
    this.diasAtrasoMedioMax,
    this.diasAtraso,
    this.faturamentoMinimo,
    this.obsCredito,
  });

  InfoCredito copyWith({
    String tipoCobranca,
    String cp1,
    String cp2,
    String cp3,
    String cp4,
    String cp5,
    dynamic prazoMedio,
    dynamic limiteCredito,
    dynamic rentabilidade,
    dynamic liberarPedidoAposSeparacao,
    dynamic diasSemComprasMax,
    dynamic diasAtrasoMax,
    dynamic diasAtrasoMedioMax,
    dynamic diasAtraso,
    dynamic faturamentoMinimo,
    String obsCredito,
  }) =>
      InfoCredito(
        tipoCobranca: tipoCobranca ?? this.tipoCobranca,
        cp1: cp1 ?? this.cp1,
        cp2: cp2 ?? this.cp2,
        cp3: cp3 ?? this.cp3,
        cp4: cp4 ?? this.cp4,
        cp5: cp5 ?? this.cp5,
        prazoMedio: prazoMedio ?? this.prazoMedio,
        limiteCredito: limiteCredito ?? this.limiteCredito,
        rentabilidade: rentabilidade ?? this.rentabilidade,
        liberarPedidoAposSeparacao:
            liberarPedidoAposSeparacao ?? this.liberarPedidoAposSeparacao,
        diasSemComprasMax: diasSemComprasMax ?? this.diasSemComprasMax,
        diasAtrasoMax: diasAtrasoMax ?? this.diasAtrasoMax,
        diasAtrasoMedioMax: diasAtrasoMedioMax ?? this.diasAtrasoMedioMax,
        diasAtraso: diasAtraso ?? this.diasAtraso,
        faturamentoMinimo: faturamentoMinimo ?? this.faturamentoMinimo,
        obsCredito: obsCredito ?? this.obsCredito,
      );

  factory InfoCredito.fromJson(String str) =>
      InfoCredito.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoCredito.fromMap(Map<String, dynamic> json) => InfoCredito(
        tipoCobranca:
            json["TipoCobranca"] == null ? null : json["TipoCobranca"],
        cp1: json["CP1"] == null ? null : json["CP1"],
        cp2: json["CP2"] == null ? null : json["CP2"],
        cp3: json["CP3"] == null ? null : json["CP3"],
        cp4: json["CP4"] == null ? null : json["CP4"],
        cp5: json["CP5"] == null ? null : json["CP5"],
        prazoMedio: json["Prazo_Medio"] == null ? null : json["Prazo_Medio"],
        limiteCredito:
            json["LimiteCredito"] == null ? null : json["LimiteCredito"],
        rentabilidade:
            json["Rentabilidade"] == null ? null : json["Rentabilidade"],
        liberarPedidoAposSeparacao: json["Liberar_Pedido_Apos_Separacao"],
        diasSemComprasMax: json["Dias_Sem_Compras_Max"] == null
            ? null
            : json["Dias_Sem_Compras_Max"],
        diasAtrasoMax:
            json["Dias_Atraso_Max"] == null ? null : json["Dias_Atraso_Max"],
        diasAtrasoMedioMax: json["Dias_Atraso_Medio_Max"] == null
            ? null
            : json["Dias_Atraso_Medio_Max"],
        diasAtraso: json["Dias_Atraso"] == null ? null : json["Dias_Atraso"],
        faturamentoMinimo: json["Faturamento_Minimo"] == null
            ? null
            : json["Faturamento_Minimo"],
        obsCredito: json["ObsCredito"] == null ? null : json["ObsCredito"],
      );

  Map<String, dynamic> toMap() => {
        "TipoCobranca": tipoCobranca == null ? null : tipoCobranca,
        "CP1": cp1 == null ? null : cp1,
        "CP2": cp2 == null ? null : cp2,
        "CP3": cp3 == null ? null : cp3,
        "CP4": cp4 == null ? null : cp4,
        "CP5": cp5 == null ? null : cp5,
        "Prazo_Medio": prazoMedio == null ? null : prazoMedio,
        "LimiteCredito": limiteCredito == null ? null : limiteCredito,
        "Rentabilidade": rentabilidade == null ? null : rentabilidade,
        "Liberar_Pedido_Apos_Separacao": liberarPedidoAposSeparacao,
        "Dias_Sem_Compras_Max":
            diasSemComprasMax == null ? null : diasSemComprasMax,
        "Dias_Atraso_Max": diasAtrasoMax == null ? null : diasAtrasoMax,
        "Dias_Atraso_Medio_Max":
            diasAtrasoMedioMax == null ? null : diasAtrasoMedioMax,
        "Dias_Atraso": diasAtraso == null ? null : diasAtraso,
        "Faturamento_Minimo":
            faturamentoMinimo == null ? null : faturamentoMinimo,
        "ObsCredito": obsCredito == null ? null : obsCredito,
      };
}

class Iten {
  final dynamic seq;
  final dynamic item;
  final dynamic material;
  final String dsMaterial;
  final dynamic quantidade;
  final dynamic codUnidade;
  final dynamic codUndFator;
  final String dsUnidade;
  final dynamic precoUnitario;
  final dynamic precoTotal;
  final dynamic movimento;
  final dynamic saldo;
  final dynamic rentabilidade;
  final dynamic percRentabilidade;

  Iten({
    this.seq,
    this.item,
    this.material,
    this.dsMaterial,
    this.quantidade,
    this.codUnidade,
    this.codUndFator,
    this.dsUnidade,
    this.precoUnitario,
    this.precoTotal,
    this.movimento,
    this.saldo,
    this.rentabilidade,
    this.percRentabilidade,
  });

  Iten copyWith({
    dynamic seq,
    dynamic item,
    dynamic material,
    String dsMaterial,
    dynamic quantidade,
    dynamic codUnidade,
    dynamic codUndFator,
    String dsUnidade,
    dynamic precoUnitario,
    dynamic precoTotal,
    dynamic movimento,
    dynamic saldo,
    dynamic rentabilidade,
    dynamic percRentabilidade,
  }) =>
      Iten(
        seq: seq ?? this.seq,
        item: item ?? this.item,
        material: material ?? this.material,
        dsMaterial: dsMaterial ?? this.dsMaterial,
        quantidade: quantidade ?? this.quantidade,
        codUnidade: codUnidade ?? this.codUnidade,
        codUndFator: codUndFator ?? this.codUndFator,
        dsUnidade: dsUnidade ?? this.dsUnidade,
        precoUnitario: precoUnitario ?? this.precoUnitario,
        precoTotal: precoTotal ?? this.precoTotal,
        movimento: movimento ?? this.movimento,
        saldo: saldo ?? this.saldo,
        rentabilidade: rentabilidade ?? this.rentabilidade,
        percRentabilidade: percRentabilidade ?? this.percRentabilidade,
      );

  factory Iten.fromJson(String str) => Iten.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Iten.fromMap(Map<String, dynamic> json) => Iten(
        seq: json["seq"] == null ? null : json["seq"],
        item: json["item"] == null ? null : json["item"],
        material: json["material"] == null ? null : json["material"],
        dsMaterial: json["ds_material"] == null ? null : json["ds_material"],
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        codUnidade: json["cod_unidade"] == null ? null : json["cod_unidade"],
        codUndFator:
            json["cod_und_fator"] == null ? null : json["cod_und_fator"],
        dsUnidade: json["ds_unidade"] == null ? null : json["ds_unidade"],
        precoUnitario: json["preco_unitario"] == null
            ? null
            : json["preco_unitario"].toDouble(),
        precoTotal:
            json["preco_total"] == null ? null : json["preco_total"].toDouble(),
        movimento: json["movimento"] == null ? null : json["movimento"],
        saldo: json["saldo"] == null ? null : json["saldo"],
        rentabilidade: json["rentabilidade"] == null
            ? null
            : json["rentabilidade"].toDouble(),
        percRentabilidade: json["perc_rentabilidade"] == null
            ? null
            : json["perc_rentabilidade"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "seq": seq == null ? null : seq,
        "item": item == null ? null : item,
        "material": material == null ? null : material,
        "ds_material": dsMaterial == null ? null : dsMaterial,
        "quantidade": quantidade == null ? null : quantidade,
        "cod_unidade": codUnidade == null ? null : codUnidade,
        "cod_und_fator": codUndFator == null ? null : codUndFator,
        "ds_unidade": dsUnidade == null ? null : dsUnidade,
        "preco_unitario": precoUnitario == null ? null : precoUnitario,
        "preco_total": precoTotal == null ? null : precoTotal,
        "movimento": movimento == null ? null : movimento,
        "saldo": saldo == null ? null : saldo,
        "rentabilidade": rentabilidade == null ? null : rentabilidade,
        "perc_rentabilidade":
            percRentabilidade == null ? null : percRentabilidade,
      };
}

class Observacoes {
  final List<Observacao> observacao;
  final List<Observacao> observacaoInterna;

  Observacoes({
    this.observacao,
    this.observacaoInterna,
  });

  Observacoes copyWith({
    List<Observacao> observacao,
    List<Observacao> observacaoInterna,
  }) =>
      Observacoes(
        observacao: observacao ?? this.observacao,
        observacaoInterna: observacaoInterna ?? this.observacaoInterna,
      );

  factory Observacoes.fromJson(String str) =>
      Observacoes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Observacoes.fromMap(Map<String, dynamic> json) => Observacoes(
        observacao: json["observacao"] == null
            ? null
            : List<Observacao>.from(
                json["observacao"].map((x) => Observacao.fromMap(x))),
        observacaoInterna: json["observacaoInterna"] == null
            ? null
            : List<Observacao>.from(
                json["observacaoInterna"].map((x) => Observacao.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "observacao": observacao == null
            ? null
            : List<dynamic>.from(observacao.map((x) => x.toMap())),
        "observacaoInterna": observacaoInterna == null
            ? null
            : List<dynamic>.from(observacaoInterna.map((x) => x.toMap())),
      };
}

class Observacao {
  final dynamic codPedidoObs;
  final dynamic obs;

  Observacao({
    this.codPedidoObs,
    this.obs,
  });

  Observacao copyWith({
    dynamic codPedidoObs,
    dynamic obs,
  }) =>
      Observacao(
        codPedidoObs: codPedidoObs ?? this.codPedidoObs,
        obs: obs ?? this.obs,
      );

  factory Observacao.fromJson(String str) =>
      Observacao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Observacao.fromMap(Map<String, dynamic> json) => Observacao(
        codPedidoObs:
            json["cod_pedido_obs"] == null ? null : json["cod_pedido_obs"],
        obs: json["obs"],
      );

  Map<String, dynamic> toMap() => {
        "cod_pedido_obs": codPedidoObs == null ? null : codPedidoObs,
        "obs": obs,
      };
}

class Ocorrencia {
  final dynamic tipoOc;
  final String dsTipoOc;
  final dynamic codUsrAutorizou;
  final dynamic nomeUsrAutorizou;
  final String responsavel;
  final String dsOcorrencia;

  Ocorrencia({
    this.tipoOc,
    this.dsTipoOc,
    this.codUsrAutorizou,
    this.nomeUsrAutorizou,
    this.responsavel,
    this.dsOcorrencia,
  });

  Ocorrencia copyWith({
    dynamic tipoOc,
    String dsTipoOc,
    dynamic codUsrAutorizou,
    dynamic nomeUsrAutorizou,
    String responsavel,
    String dsOcorrencia,
  }) =>
      Ocorrencia(
        tipoOc: tipoOc ?? this.tipoOc,
        dsTipoOc: dsTipoOc ?? this.dsTipoOc,
        codUsrAutorizou: codUsrAutorizou ?? this.codUsrAutorizou,
        nomeUsrAutorizou: nomeUsrAutorizou ?? this.nomeUsrAutorizou,
        responsavel: responsavel ?? this.responsavel,
        dsOcorrencia: dsOcorrencia ?? this.dsOcorrencia,
      );

  factory Ocorrencia.fromJson(String str) =>
      Ocorrencia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ocorrencia.fromMap(Map<String, dynamic> json) => Ocorrencia(
        tipoOc: json["tipo_oc"] == null ? null : json["tipo_oc"],
        dsTipoOc: json["ds_tipo_oc"] == null ? null : json["ds_tipo_oc"],
        codUsrAutorizou: json["cod_usr_autorizou"] == null
            ? null
            : json["cod_usr_autorizou"],
        nomeUsrAutorizou: json["nome_usr_autorizou"],
        responsavel: json["responsavel"] == null ? null : json["responsavel"],
        dsOcorrencia:
            json["ds_ocorrencia"] == null ? null : json["ds_ocorrencia"],
      );

  Map<String, dynamic> toMap() => {
        "tipo_oc": tipoOc == null ? null : tipoOc,
        "ds_tipo_oc": dsTipoOc == null ? null : dsTipoOc,
        "cod_usr_autorizou": codUsrAutorizou == null ? null : codUsrAutorizou,
        "nome_usr_autorizou": nomeUsrAutorizou,
        "responsavel": responsavel == null ? null : responsavel,
        "ds_ocorrencia": dsOcorrencia == null ? null : dsOcorrencia,
      };
}

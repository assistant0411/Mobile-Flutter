class ListaSimples {
  Info info;

  ListaSimples({this.info});

  ListaSimples.fromJson(Map<String, dynamic> json) {
    info = json['Info'] != null ? new Info.fromJson(json['Info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['Info'] = this.info.toJson();
    }
    return data;
  }
}

class Info {
  String dataGeracao;
  String funcao;
  int quantidade;
  int pagina;
  List<Itens> itens;

  Info(
      {this.dataGeracao,
      this.funcao,
      this.quantidade,
      this.pagina,
      this.itens});

  Info.fromJson(Map<String, dynamic> json) {
    dataGeracao = json['DataGeracao'];
    funcao = json['Funcao'];
    quantidade = json['Quantidade'];
    pagina = json['Pagina'];
    if (json['Itens'] != null) {
      itens = new List<Itens>();
      json['Itens'].forEach((v) {
        itens.add(new Itens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DataGeracao'] = this.dataGeracao;
    data['Funcao'] = this.funcao;
    data['Quantidade'] = this.quantidade;
    data['Pagina'] = this.pagina;
    if (this.itens != null) {
      data['Itens'] = this.itens.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itens {
  int cliente;
  String fantasia;
  String cNPJ;

  Itens({this.cliente, this.fantasia, this.cNPJ});

  Itens.fromJson(Map<String, dynamic> json) {
    cliente = json['Cliente'];
    fantasia = json['Fantasia'];
    cNPJ = json['CNPJ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cliente'] = this.cliente;
    data['Fantasia'] = this.fantasia;
    data['CNPJ'] = this.cNPJ;
    return data;
  }
}

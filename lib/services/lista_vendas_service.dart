import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:mercantis_flutter/models/lista_vendas_model.dart';
import 'package:expandable/expandable.dart';
import 'package:mercantis_flutter/services/newDio.dart';

class Services {
  static const String url =
      'http://api-mobile.tanis.com.br/api/mobile/v10/Vendas/Pedido/NaoLiberados?CNPJ=00085822000112';
  static DioConnection dioSrvc = DioConnection();
  static Future<List<Iten>> getVendas() async {
    try {
      Response response = await dioSrvc.dioConnection.get(url);
      if (response.statusCode == 200) {
        print(response.data);
        List<Iten> list = parseVendas(response.data);
        return list;
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  static List<Iten> parseVendas(Map responseBody) {
    ListaVendas _listaVendas = ListaVendas.fromMap(responseBody);
    print(_listaVendas.info.itens);
    return _listaVendas.info.itens;
  }
}
